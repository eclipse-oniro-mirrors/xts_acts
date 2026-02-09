// 1. 引入根目录的工具测试 (根据你最开始的描述)
import utilTest from './Util.test';

// ---------------------------------------------------------
// 2. 引入 array 文件夹下的测试用例
// ---------------------------------------------------------
import copyWithinTest from './array/CopyWithin.test';
import filterTest from './array/Filter.test';
import fromTest from './array/From.test';
import mapTest from './array/Map.test';
import sliceTest from './array/Slice.test';
import spliceTest from './array/Splice.test';
import arrayPopTest from './array/ArrayPop.test';
import arrayPushTest from './array/ArrayPush.test';
import arraySpliceTest from './array/ArraySplice.test';

// ---------------------------------------------------------
// 3. 引入 object 文件夹下的测试用例
// ---------------------------------------------------------
import assignTest from './object/Assign.test';
import freezeTest from './object/Freeze.test';
import getProtoTypeOfTest from './object/GetProtoTypeOf.test';
import keysTest from './object/Keys.test';
import sealTest from './object/Seal.test';
import setProtoTypeOfTest from './object/SetProtoTypeOf.test';

// ---------------------------------------------------------
// 4. 引入 proxy 文件夹下的测试用例
// (注意：Proxy 文件夹下的文件名比较长，如果报错请核对文件名拼写)
// ---------------------------------------------------------

import actsProxyAndReflect6Test from './proxy/ActsProxyAndReflect6Test.test';

import actsProxyAndReflectApplyTest from './proxy/ActsProxyAndReflectApplyTest.test';

import actsProxyAndReflectConstructTest from './proxy/ActsProxyAndReflectConstructTest.test';

import actsProxyAndReflectGetTest from './proxy/ActsProxyAndReflectGetTest.test';

import actsProxyAndReflectHasTest from './proxy/ActsProxyAndReflectHasTest.test';

import actsProxyAndReflectSetTest from './proxy/ActsProxyAndReflectSetTest.test';


// ---------------------------------------------------------
// 5. 引入 map 文件夹下的测试用例
// ---------------------------------------------------------

import mapDeleteTest from './map/MapDelete.test';
import mapSetTest from './map/MapSet.test';

// ---------------------------------------------------------
// 6. 引入 set 文件夹下的测试用例
// ---------------------------------------------------------

import setAddTest from './set/SetAdd.test';
import setDeleteTest from './set/SetDelete.test';

export default function testsuite() {
  // 运行 Util
  utilTest();

  // 运行 Array 测试
  copyWithinTest();
  filterTest();
  fromTest();
  mapTest();
  sliceTest();
  spliceTest();
  arrayPopTest();
  arrayPushTest();
  arraySpliceTest();

  // 运行 Object 测试
  assignTest();
  freezeTest();
  getProtoTypeOfTest();
  keysTest();
  sealTest();
  setProtoTypeOfTest();

  // 运行 Proxy 测试
  actsProxyAndReflect6Test();
  actsProxyAndReflectApplyTest();
  actsProxyAndReflectConstructTest();
  actsProxyAndReflectGetTest();
  actsProxyAndReflectHasTest();
  actsProxyAndReflectSetTest();

  // 运行 Map 测试
  mapDeleteTest();
  mapSetTest();

  // 运行 Set 测试
  setAddTest();
  setDeleteTest();
}