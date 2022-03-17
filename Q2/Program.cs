// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

Dog myDog = new Dog();
myDog.GetSounds(); // woofwoof
Cat myCat = new Cat();
myCat.GetSounds(); // meowmeow

interface IAnimal
{
    void GetSounds();
}

class Dog : IAnimal
{
    public void GetSounds()
    {
        Console.WriteLine("woofwoof");
    }
}

class Cat : IAnimal
{
    public void GetSounds()
    {
        Console.WriteLine("meowmeow");
    }
}