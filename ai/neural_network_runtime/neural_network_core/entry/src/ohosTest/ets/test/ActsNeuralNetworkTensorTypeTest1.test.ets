/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import neuralnetworkcoretest from 'libneuralnetworkcoretest.so'

export default function ActsNeuralNetworkTensorTypeTest1() {
  describe('ActsNeuralNetworkTensorTypeTest1', () => {

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0100
     * @tc.desc   Test OH_NN_ADD_ACTIVATIONTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(1);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0200
     * @tc.desc   Test OH_NN_AVG_POOL_KERNEL_SIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(2);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0300
     * @tc.desc   Test OH_NN_AVG_POOL_STRIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(3);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0400
     * @tc.desc   Test OH_NN_AVG_POOL_PAD_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(4);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0500
     * @tc.desc   Test OH_NN_AVG_POOL_PAD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(5);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0600
     * @tc.desc   Test OH_NN_AVG_POOL_ACTIVATION_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(6);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0700
     * @tc.desc   Test OH_NN_BATCH_NORM_EPSILON.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(7);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0800
     * @tc.desc   Test OH_NN_BATCH_TO_SPACE_ND_BLOCKSIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(8);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType0900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_0900
     * @tc.desc   Test OH_NN_BATCH_TO_SPACE_ND_CROPS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(9);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_0900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1000
     * @tc.desc   Test OH_NN_CONCAT_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(10);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1100
     * @tc.desc   Test OH_NN_CONV2D_STRIDES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(11);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1200
     * @tc.desc   Test OH_NN_CONV2D_PAD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(12);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1300
     * @tc.desc   Test OH_NN_CONV2D_DILATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(13);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1400
     * @tc.desc   Test OH_NN_CONV2D_PAD_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(14);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1500
     * @tc.desc   Test OH_NN_CONV2D_ACTIVATION_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(15);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1600
     * @tc.desc   Test OH_NN_CONV2D_GROUP.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(16);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1700
     * @tc.desc   Test OH_NN_CONV2D_TRANSPOSE_STRIDES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(17);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1800
     * @tc.desc   Test OH_NN_CONV2D_TRANSPOSE_PAD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(18);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType1900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_1900
     * @tc.desc   Test OH_NN_CONV2D_TRANSPOSE_DILATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(19);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_1900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2000
     * @tc.desc   Test OH_NN_CONV2D_TRANSPOSE_OUTPUT_PADDINGS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(20);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2100
     * @tc.desc   Test OH_NN_CONV2D_TRANSPOSE_PAD_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(21);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2200
     * @tc.desc   Test OH_NN_CONV2D_TRANSPOSE_ACTIVATION_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(22);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2300
     * @tc.desc   Test OH_NN_CONV2D_TRANSPOSE_GROUP.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(23);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2400
     * @tc.desc   Test OH_NN_DEPTHWISE_CONV2D_NATIVE_STRIDES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(24);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2500
     * @tc.desc   Test OH_NN_DEPTHWISE_CONV2D_NATIVE_PAD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(25);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2600
     * @tc.desc   Test OH_NN_DEPTHWISE_CONV2D_NATIVE_DILATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(26);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2700
     * @tc.desc   Test OH_NN_DEPTHWISE_CONV2D_NATIVE_PAD_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(27);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2800
     * @tc.desc   Test OH_NN_DEPTHWISE_CONV2D_NATIVE_ACTIVATION_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(28);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType2900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_2900
     * @tc.desc   Test OH_NN_DIV_ACTIVATIONTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(29);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_2900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3000
     * @tc.desc   Test OH_NN_ELTWISE_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(30);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3100
     * @tc.desc   Test OH_NN_FULL_CONNECTION_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(31);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3200
     * @tc.desc   Test OH_NN_FULL_CONNECTION_ACTIVATIONTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(32);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3300
     * @tc.desc   Test OH_NN_MATMUL_TRANSPOSE_A.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(33);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3400
     * @tc.desc   Test OH_NN_MATMUL_TRANSPOSE_B.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(34);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3500
     * @tc.desc   Test OH_NN_MATMUL_ACTIVATION_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(35);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3600
     * @tc.desc   Test OH_NN_MAX_POOL_KERNEL_SIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(36);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3700
     * @tc.desc   Test OH_NN_MAX_POOL_STRIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(37);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3800
     * @tc.desc   Test OH_NN_MAX_POOL_PAD_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(38);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType3900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_3900
     * @tc.desc   Test OH_NN_MAX_POOL_PAD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(39);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_3900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4000
     * @tc.desc   Test OH_NN_MAX_POOL_ACTIVATION_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(40);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4100
     * @tc.desc   Test OH_NN_MUL_ACTIVATION_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(41);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4200
     * @tc.desc   Test OH_NN_ONE_HOT_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(42);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4300
     * @tc.desc   Test OH_NN_PAD_CONSTANT_VALUE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(43);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4400
     * @tc.desc   Test OH_NN_SCALE_ACTIVATIONTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(44);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4500
     * @tc.desc   Test OH_NN_SCALE_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(45);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4600
     * @tc.desc   Test OH_NN_SOFTMAX_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(46);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4700
     * @tc.desc   Test OH_NN_SPACE_TO_BATCH_ND_BLOCK_SHAPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(47);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4800
     * @tc.desc   Test OH_NN_SPACE_TO_BATCH_ND_PADDINGS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(48);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType4900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_4900
     * @tc.desc   Test OH_NN_SPLIT_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(49);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_4900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5000
     * @tc.desc   Test OH_NN_SPLIT_OUTPUT_NUM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(50);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5100
     * @tc.desc   Test OH_NN_SPLIT_SIZE_SPLITS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(51);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5200
     * @tc.desc   Test OH_NN_SQUEEZE_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(52);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5300
     * @tc.desc   Test OH_NN_STACK_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(53);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5400
     * @tc.desc   Test OH_NN_STRIDED_SLICE_BEGIN_MASK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(54);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5500
     * @tc.desc   Test OH_NN_STRIDED_SLICE_END_MASK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(55);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5600
     * @tc.desc   Test OH_NN_STRIDED_SLICE_ELLIPSIS_MASK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(56);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5700
     * @tc.desc   Test OH_NN_STRIDED_SLICE_NEW_AXIS_MASK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(57);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5800
     * @tc.desc   Test OH_NN_STRIDED_SLICE_SHRINK_AXIS_MASK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(58);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType5900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_5900
     * @tc.desc   Test OH_NN_SUB_ACTIVATIONTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(59);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_5900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6000
     * @tc.desc   Test OH_NN_REDUCE_MEAN_KEEP_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(60);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6100
     * @tc.desc   Test OH_NN_RESIZE_BILINEAR_NEW_HEIGHT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(61);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6200
     * @tc.desc   Test OH_NN_RESIZE_BILINEAR_NEW_WIDTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(62);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6300
     * @tc.desc   Test OH_NN_RESIZE_BILINEAR_PRESERVE_ASPECT_RATIO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(63);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6400
     * @tc.desc   Test OH_NN_RESIZE_BILINEAR_COORDINATE_TRANSFORM_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(64);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6500
     * @tc.desc   Test OH_NN_RESIZE_BILINEAR_EXCLUDE_OUTSIDE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(65);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6600
     * @tc.desc   Test OH_NN_LAYER_NORM_BEGIN_NORM_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(66);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6700
     * @tc.desc   Test OH_NN_LAYER_NORM_EPSILON.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(67);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6800
     * @tc.desc   Test OH_NN_LAYER_NORM_BEGIN_PARAM_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(68);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType6900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_6900
     * @tc.desc   Test OH_NN_LAYER_NORM_ELEMENTWISE_AFFINE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(69);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_6900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7000
     * @tc.desc   Test OH_NN_REDUCE_PROD_KEEP_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(70);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7100
     * @tc.desc   Test OH_NN_REDUCE_ALL_KEEP_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(71);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7200
     * @tc.desc   Test OH_NN_QUANT_DTYPE_CAST_SRC_T.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(72);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7300
     * @tc.desc   Test OH_NN_QUANT_DTYPE_CAST_DST_T.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(73);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7400
     * @tc.desc   Test OH_NN_TOP_K_SORTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(74);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7500
     * @tc.desc   Test OH_NN_ARG_MAX_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(75);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7600
     * @tc.desc   Test OH_NN_ARG_MAX_KEEPDIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(76);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7700
     * @tc.desc   Test OH_NN_UNSQUEEZE_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(77);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7800
     * @tc.desc   Test OH_NN_UNSTACK_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(78);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType7900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_7900
     * @tc.desc   Test OH_NN_FLATTEN_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(79);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_7900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8000
     * @tc.desc   Test OH_NN_DEPTH_TO_SPACE_BLOCK_SIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(80);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8000 catch err: " + err);
          done();
        }
      })
  })
}
