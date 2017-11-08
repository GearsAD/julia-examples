using PyCall
# Change to local folder
cd(dirname(@__FILE__)); # Might want to change this
unshift!(PyVector(pyimport("sys")["path"]), "")
# A simple function that says hi from Julia

function juliaSayHi(HEY::Vector{Bool}, X)
    println("[In Julia] Hi From Julia!");
    @show HEY[1] = true
    @show X
end

# Let's initialize the Python module Python2Julia
pythonModule = pyimport("Python2Julia")
# And create a CallingJulia object
println("[In Julia] Creating the object CallingJulia...");
myheyheyhey = Bool[false]
pythonClass = pythonModule[:CallingJulia]((x) -> juliaSayHi(myheyheyhey,x)) #I know, it's a Julia function, no casting... right?
# And then call a method in it
println("[In Julia] Okay calling the Python...");
pythonClass[:callMeBack]()

@show myheyheyhey
