
import finalizationRegistryRegisterTest from "./symboltest/FinalizationRegistryRegister.test";
import finalizationRegistryUnregisterTest from "./symboltest/FinalizationRegistryUnregister.test";
import symbolAsyncIteratorTestTest from "./symboltest/SymbolAsyncIterator.test";
import symbolConstructorTestTest from "./symboltest/SymbolConstructor.test";
import symbolForTestTest from "./symboltest/SymbolFor.test";
import symbolHasInstanceTest from "./symboltest/SymbolHasInstance.test";
import symbolIsConcatSpreadableTest from "./symboltest/SymbolIsConcatSpreadable.test";
import symbolIteratorTestTest from "./symboltest/SymbolIterator.test";
import symbolKeyForTestTest from "./symboltest/SymbolKeyFor.test";
import symbolMatchTestTest from "./symboltest/SymbolMatch.test";
import symbolMatchAllTestTest from "./symboltest/SymbolMatchAll.test";
import symbolReplaceTestTest from "./symboltest/SymbolReplace.test";
import symbolSearchTestTest from "./symboltest/SymbolSearch.test";
import symbolSpeciesTestTest from "./symboltest/SymbolSpecies.test";
import symbolSplitTestTest from "./symboltest/SymbolSplit.test";
import symbolToPrimitiveTestTest from "./symboltest/SymbolToPrimitive.test";
import symbolToStringTestTest from "./symboltest/SymbolToString.test";


export default function testsuite() {

 
  finalizationRegistryRegisterTest();
  finalizationRegistryUnregisterTest();
  symbolAsyncIteratorTestTest();
  symbolConstructorTestTest();
  symbolForTestTest();
  symbolHasInstanceTest();
  symbolIsConcatSpreadableTest();
  symbolIteratorTestTest();
  symbolKeyForTestTest();
  symbolMatchTestTest();
  symbolMatchAllTestTest();
  symbolReplaceTestTest();
  symbolSearchTestTest();
  symbolSpeciesTestTest();
  symbolSplitTestTest();
  symbolToPrimitiveTestTest();
  symbolToStringTestTest();

}