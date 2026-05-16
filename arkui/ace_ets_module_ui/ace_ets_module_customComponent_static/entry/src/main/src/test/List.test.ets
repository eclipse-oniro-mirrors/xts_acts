'use static';
import CustomComponentTest from './CustomComponentTest/CustomComponent.test';
import CustomComponentLifecycleTest from './CustomComponentTest/CustomComponentLifecycle.test';

export default function testsuite() {
  CustomComponentTest();
  CustomComponentLifecycleTest();
}
