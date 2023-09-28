public class HelloWorld {

    public static void main(String[] args) {
        HelloWorld greeting = new HelloWorld();
        greeting.sayHiFiltered("Semmle");
    }

    void sayHiFiltered(String name) {
        String cmd;
        switch (name) {
            case "Semmle" -> {
                cmd = "odasa";
            }
            case "GitHub" -> {
                cmd = "codeql";
            }
            default -> {
                throw new IllegalArgumentException("nope");
            }
        }
        sayHi(name, cmd);
    }

    void sayHi(String name, String product) {
        System.out.print("Hello " + name + ". ");
        System.out.println("How is " + product + " doing?");
    }
}
