import abilityTest from "./ActsAbility.test";
import pasteboardParametersTest from "./PasteboardParametersTest.test";
import pasteboardReturnTest from "./PasteboardReturnTest.test";
export default function testsuite() {
    abilityTest();
    pasteboardParametersTest();
    pasteboardReturnTest();
}