using Xunit;

namespace HolaMundoApp.Tests
{
    public class HolaTests
    {
        [Fact]
        public void TestHolaMundo()
        {
            var mensaje = "Hola Mundo desde C#!";
            Assert.Equal("Hola Mundo desde C#!", mensaje);
        }
    }
}
