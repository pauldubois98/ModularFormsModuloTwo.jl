"""Input/Output storage routines for modular forms modulo 2"""



"""
    saveForm(f, name, file_name)

Save the modular form modulo 2 f as name in file_name.
"""
function saveForm(f::ModularForm, name::String, file_name::String, module_data::Bool=true)
    if module_data
        file=open(joinpath(@__DIR__, file_name), "a")
    else
        file=open(file_name, "a")
    end
    write(file, name)
    write(file, ";")
    write(file, string(f.n))
    write(file, ";")
    for i = f.nzind
        write(file, string(i)*',')
    end
    write(file, "\n\n")
    close(file)
end

"""
    saveFormList(forms_list, file_name)

Save the modular forms modulo 2 f as name in file_name.
"""
function saveFormList(forms_list::ModularFormOrNothingList, file_name::String, module_data::Bool=true)
    if module_data
        file=open(joinpath(@__DIR__, file_name), "a")
    else
        file=open(file_name, "a")
    end
    for f in forms_list
        if f === nothing
            write(file, "nothing\n")
        else
            write(file, string(f.n))
            write(file, ";")
            for i = f.nzind
                write(file, string(i)*',')
            end
            write(file, "\n")
        end
    end
    close(file)
end



"""
    loadForm(name, file_name)

Load the modular form modulo 2 name from file_name.
"""
function loadForm(name::String, file_name::String, module_data::Bool=true)::ModularForm
    if module_data
        file=open(joinpath(@__DIR__, file_name), "r")
    else
        file=open(file_name, "r")
    end
    for line in eachline(file)
        sp = split(line, ';')
        if length(sp)==3
            if name==sp[1]
                n = parse(Int, sp[2] )
                f = spzeros(Int8, n)
                if length(sp[3])>0
                    for i in split(sp[3][1:end-1], ',')
                        f[parse(Int, i)]=1
                    end
                end
                close(file)
                return f
            end
        end
    end
    # Error not found
    throw(LoadError(file, 0, name*" not found"))
end

"""
    loadFormList(file_name)

Load the modular form list from file_name.
"""
function loadFormList(file_name::String, module_data::Bool=true)::ModularFormOrNothingList
    if module_data
        file=open(joinpath(@__DIR__, file_name), "r")
    else
        file=open(file_name, "r")
    end
    list = ModularFormOrNothingList(nothing, 100)
    i = 1
    for line in eachline(file)
        if line == "nothing\n"
            list[i]=nothing
        else
            sp = split(line, ';')
            if length(sp)==2
                n = parse(Int, sp[1])
                f = spzeros(Int8, n)
                if length(sp[2])>0
                    for i in split(sp[2][1:end-1], ',')
                        f[parse(Int, i)]=1
                    end
                end
                list[i]=f
                i += 1
            end
        end
    end
    close(file)
    return list
end