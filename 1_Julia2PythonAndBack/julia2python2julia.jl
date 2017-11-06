using PyCall
# Change to local folder
cd("/home/gears/julia-examples/1_Julia2PythonAndBack/"); # Might want to change this
unshift!(PyVector(pyimport("sys")["path"]), "")
# A simple function that says hi from Julia
function juliaSayHi()
    println("[In Julia] Hi From Julia!");
end
# Let's initialize the Python module Python2Julia
pythonModule = pyimport("Python2Julia")
# And create a CallingJulia object
println("[In Julia] Creating the object CallingJulia...");
pythonClass = pythonModule[:CallingJulia](juliaSayHi) #I know, it's a Julia function, no casting... right?
# And then call a method in it
println("[In Julia] Okay calling the Python...");
pythonClass[:callMeBack]()
