
import finalizationRegistryComprehensiveTest from "./finalization/FinalizationRegistryComprehensive.test";
import finalizationRegistryTest from "./finalization/FinalizationRegistry.test";

export default function testsuite() {
  finalizationRegistryComprehensiveTest();
  finalizationRegistryTest();
}