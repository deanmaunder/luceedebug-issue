
component extends="BaseObject" {
    
    public function init() {
        variables.dothings = "things";
        return this;
    }

    public function myFunc() {
        variables.otherthings = { something: "thing", someotherthing: { thing: "nothing" } }
        return "did a thing"
    }
}