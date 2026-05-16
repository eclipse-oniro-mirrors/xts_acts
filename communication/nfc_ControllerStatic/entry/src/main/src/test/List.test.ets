import nfcControllerTest from "./NfcController.test"
import nfcCardEmulationTest from "./NfcCardEmulation.test"
import nfcTagTest from "./NfcTag.test"
import nfcATagSessionTest from "./ATagSession.test"
import TagABFVTest from "./TagABFV.test"
import nfcIsoDepTagTest from "./IsoDepTag.test"
import nfcMifareClassicTagTest from "./MifareClassicTag.test"
import nfcMifareUltralightTagTest from "./MifareUltralightTag.test"
import nfcNDEFTagTest from "./NDEFTag.test"
export default function testsuite() {
  nfcControllerTest();
  nfcTagTest();
  nfcATagSessionTest();
  TagABFVTest();
  nfcIsoDepTagTest();
  nfcMifareClassicTagTest();
  nfcMifareUltralightTagTest();
  nfcNDEFTagTest();
  nfcCardEmulationTest();
}