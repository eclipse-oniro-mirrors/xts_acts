import sendableClassTest from './SendableClass/SendableClass.test';
import sendableClass_staticTest from './SendableClass_static/SendableClass_static.test';
import sendableClass_static_readonlyTest from './SendableClass_static_readonly/SendableClass_static_readonly.test';
import sendableClassFuncSetTest from './SendableClassFuncSet/SendableClassFuncSet.test';
import sendableInheritClassTest from './SendableClassInherit/SendableClassInherit.test';
import tripleInheritanceTaskPoolTest from './tripleInheritanceTaskPool.test';
import tripleInheritanceWorkerTest from './tripleInheritanceWorker.test';

export default function testsuite() {
  sendableClassTest();
  sendableClass_staticTest();
  sendableClass_static_readonlyTest();
  sendableClassFuncSetTest();
  sendableInheritClassTest();
  tripleInheritanceTaskPoolTest();
  tripleInheritanceWorkerTest();
}