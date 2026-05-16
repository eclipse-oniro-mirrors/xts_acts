import abilityTest from './Ability.test';
import ConcurrencyModularImportAsyncLockTest from './ConcurrencyModularImportAsyncLockTest.test';
import ConcurrencyModularImportPromiseTest from './ConcurrencyModularImportPromiseTest.test';
import ConcurrencyModularImportAndExportTest from './ConcurrencyModularImportAndExportTest.test';
import TSProjectAsyncTest from './TSProjectAsyncTest.test';
import TSProjectPromiseTest from './TSProjectPromiseTest.test';
import TSProjectTypedArrayTest from './TSProjectTypedArrayTest.test'
import JSProjectAsyncTest from './JSProjectAsyncTest.test'
import JSProjectPromiseTest from './JSProjectPromiseTest.test'
import JSProjectTypedArrayTest from './JSProjectTypedArrayTest.test'

export default function testsuite() {
  abilityTest();
  ConcurrencyModularImportPromiseTest();
  ConcurrencyModularImportAsyncLockTest();
  ConcurrencyModularImportAndExportTest();
  TSProjectAsyncTest();
  TSProjectPromiseTest();
  TSProjectTypedArrayTest();
  JSProjectAsyncTest();
  JSProjectPromiseTest();
  JSProjectTypedArrayTest();
}