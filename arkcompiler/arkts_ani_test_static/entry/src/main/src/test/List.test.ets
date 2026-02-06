import versionInfoTest from "./ActsVersionInfo.test";
import classOperationsTest from "./ActsClassOperations.test";
import objectOperationsTest from "./ActsObjectOperations.test"
import GlobalAndLocalReferencesTest from "./ActsGlobalAndLocalReferences.test.ets"
import globalAndLocalReferencesTest from "./ActsGlobalAndLocalReferences.test.ets"
import accessingStaticFieldsTest from "./ActsAccessingStaticFields.test.ets"
import callingStaticMethodsTest from "./ActsClassCallingStaticMethods.test";
import stringOperationsTest from "./ActsStringOperations.test"
import ArrayOperationsTest from "./ActsArrayOperations.test"
import ScopeSupportTest from "./ActsScopeSupport.test"
import JSFeatureTest from "./ActsJSFeature.test"
import EnvOperationsTest from "./ActsEnvOperations.test"
import accessingFiledsOfObjectsTest from "./ActsAccessingFiledsOfObjects.test"
import callingInstanceMethodsTest from "./ActsCallingInstanceMethods.test"
import variableOperationsTest from "./ActsVariableOperations.test";
import moduleSupportTest from "./ActsModuleSupport.test";
import nameSpaceSupportTest from "./ActsNameSpaceSupport.test";
import enumOperationsTest from "./ActsEnumOperations.test";
import tupleOperationsTest from "./ActsTupleOperations.test";
import vmOpsTest from "./ActsVmOps.test"
import exceptionTest from "./ActsException.test"
import promiseTest from "./ActsPromise.test"
import weakGlobalReferencesTest from "./ActsWeakGlobalReferences.test"

export default function testsuite() {
    versionInfoTest();
    classOperationsTest();
    objectOperationsTest();
    globalAndLocalReferencesTest();
    accessingStaticFieldsTest();
    callingStaticMethodsTest();
    stringOperationsTest();
    ArrayOperationsTest();
    ScopeSupportTest();
    JSFeatureTest();
    EnvOperationsTest();
    accessingFiledsOfObjectsTest();
    callingInstanceMethodsTest();
    variableOperationsTest();
    moduleSupportTest();
    nameSpaceSupportTest();
    enumOperationsTest();
    tupleOperationsTest();
    vmOpsTest();
    promiseTest();
    exceptionTest();
    weakGlobalReferencesTest();
}
