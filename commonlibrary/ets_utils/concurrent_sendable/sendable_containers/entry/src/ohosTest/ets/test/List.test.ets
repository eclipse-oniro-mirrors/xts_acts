import builtinContainerSendableObjectTest from './BuiltinContainerSendableObject.test';
import baselibContainerSendableObjectTest from './BaselibContainerSendableObject.test';
import collectionsContainerSendableObjectTest from './CollectionsContainerSendableObject.test';

export default function testsuite() {
  builtinContainerSendableObjectTest();
  baselibContainerSendableObjectTest();
  collectionsContainerSendableObjectTest();
}