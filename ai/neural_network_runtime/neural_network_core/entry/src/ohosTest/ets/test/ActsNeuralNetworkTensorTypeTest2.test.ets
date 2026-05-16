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

export default function ActsNeuralNetworkTensorTypeTest2() {
  describe('ActsNeuralNetworkTensorTypeTest2', () => {

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8100
     * @tc.desc   Test OH_NN_DEPTH_TO_SPACE_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(81);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8200
     * @tc.desc   Test OH_NN_RANGE_START.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(82);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8300
     * @tc.desc   Test OH_NN_RANGE_LIMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(83);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8400
     * @tc.desc   Test OH_NN_RANGE_DELTA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(84);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8500
     * @tc.desc   Test OH_NN_CONSTANT_OF_SHAPE_DATA_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(85);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8600
     * @tc.desc   Test OH_NN_CONSTANT_OF_SHAPE_VALUE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(86);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8700
     * @tc.desc   Test OH_NN_BROADCAST_TO_SHAPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(87);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8800
     * @tc.desc   Test OH_NN_INSTANCE_NORM_EPSILON.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(88);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType8900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_8900
     * @tc.desc   Test OH_NN_EXP_BASE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(89);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_8900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9000
     * @tc.desc   Test OH_NN_EXP_SCALE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(90);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9100
     * @tc.desc   Test OH_NN_EXP_SHIFT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(91);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9200
     * @tc.desc   Test OH_NN_LEAKY_RELU_NEGATIVE_SLOPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(92);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9300
     * @tc.desc   Test OH_NN_LSTM_BIDIRECTIONAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(93);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9400
     * @tc.desc   Test OH_NN_LSTM_HAS_BIAS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(94);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9500
     * @tc.desc   Test OH_NN_LSTM_INPUT_SIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(95);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9600
     * @tc.desc   Test OH_NN_LSTM_HIDDEN_SIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(96);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9700
     * @tc.desc   Test OH_NN_LSTM_NUM_LAYERS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(97);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9800
     * @tc.desc   Test OH_NN_LSTM_NUM_DIRECTIONS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(98);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType9900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_9900
     * @tc.desc   Test OH_NN_LSTM_DROPOUT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(99);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_9900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10000
     * @tc.desc   Test OH_NN_LSTM_ZONEOUT_CELL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(100);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10100
     * @tc.desc   Test OH_NN_LSTM_ZONEOUT_HIDDEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(101);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10200
     * @tc.desc   Test OH_NN_LSTM_PROJ_SIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(102);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10300
     * @tc.desc   Test OH_NN_CLIP_MAX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(103);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10400
     * @tc.desc   Test OH_NN_CLIP_MIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(104);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10500
     * @tc.desc   Test OH_NN_ALL_KEEP_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(105);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10600
     * @tc.desc   Test OH_NN_ASSERT_SUMMARIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(106);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10700
     * @tc.desc   Test OH_NN_POW_SCALE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(107);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10800
     * @tc.desc   Test OH_NN_POW_SHIFT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(108);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType10900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_10900
     * @tc.desc   Test OH_NN_AVG_POOL_ROUND_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(109);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_10900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11000
     * @tc.desc   Test OH_NN_AVG_POOL_GLOBAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(110);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11100
     * @tc.desc   Test OH_NN_FULL_CONNECTION_HAS_BIAS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(111);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11200
     * @tc.desc   Test OH_NN_FULL_CONNECTION_USE_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(112);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11300
     * @tc.desc   Test OH_NN_GELU_APPROXIMATE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(113);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11400
     * @tc.desc   Test OH_NN_MAX_POOL_ROUND_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(114);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11500
     * @tc.desc   Test OH_NN_MAX_POOL_GLOBAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(115);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11600
     * @tc.desc   Test OH_NN_PAD_PADDING_MODE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(116);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11700
     * @tc.desc   Test OH_NN_REDUCE_MEAN_REDUCE_TO_END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(117);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11800
     * @tc.desc   Test OH_NN_REDUCE_MEAN_COEFF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(118);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType11900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_11900
     * @tc.desc   Test OH_NN_REDUCE_PROD_REDUCE_TO_END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(119);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_11900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12000
     * @tc.desc   Test OH_NN_REDUCE_PROD_COEFF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(120);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12100
     * @tc.desc   Test OH_NN_REDUCE_ALL_REDUCE_TO_END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(121);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12200
     * @tc.desc   Test OH_NN_REDUCE_ALL_COEFF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(122);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12300
     * @tc.desc   Test OH_NN_TOP_K_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(123);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12400
     * @tc.desc   Test OH_NN_ARG_MAX_TOP_K.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(124);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12500
     * @tc.desc   Test OH_NN_ARG_MAX_OUT_MAX_VALUE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(125);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12600
     * @tc.desc   Test OH_NN_QUANT_DTYPE_CAST_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(126);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12700
     * @tc.desc   Test OH_NN_SLICE_AXES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(127);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12800
     * @tc.desc   Test OH_NN_TILE_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(128);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType12900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_12900
     * @tc.desc   Test OH_NN_CROP_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(129);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_12900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13000
     * @tc.desc   Test OH_NN_CROP_OFFSET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(130);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13100
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_INPUT_SIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(131);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13200
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_SCALE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(132);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13300
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_NMS_IOU_THRESHOLD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(133);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13400
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_NMS_SCORE_THRESHOLD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(134);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13500
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_MAX_DETECTIONS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(135);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13600
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_DETECTIONS_PER_CLASS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(136);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13700
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_MAX_CLASSES_PER_DETECTION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(137);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13800
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_NUM_CLASSES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(138);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType13900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_13900
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_USE_REGULAR_NMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType13900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(139);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_13900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14000
     * @tc.desc   Test OH_NN_DETECTION_POST_PROCESS_OUT_QUANTIZED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(140);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14100
     * @tc.desc   Test OH_NN_L2_NORMALIZE_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(141);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14200
     * @tc.desc   Test OH_NN_L2_NORMALIZE_EPSILON.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(142);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14300
     * @tc.desc   Test OH_NN_L2_NORMALIZE_ACTIVATION_TYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(143);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14400
     * @tc.desc   Test OH_NN_LOG_SOFTMAX_AXIS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(144);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14500
     * @tc.desc   Test OH_NN_LRN_DEPTH_RADIUS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(145);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14600
     * @tc.desc   Test OH_NN_LRN_BIAS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(146);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14700
     * @tc.desc   Test OH_NN_LRN_ALPHA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(147);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14800
     * @tc.desc   Test OH_NN_LRN_BETA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(148);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType14900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_14900
     * @tc.desc   Test OH_NN_LRN_NORM_REGION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType14900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(149);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_14900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15000
     * @tc.desc   Test OH_NN_SPACE_TO_DEPTH_BLOCK_SIZE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(150);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15100
     * @tc.desc   Test OH_NN_REDUCE_MAX_KEEP_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(151);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15200
     * @tc.desc   Test OH_NN_REDUCE_MAX_REDUCE_TO_END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(152);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15300
     * @tc.desc   Test OH_NN_REDUCE_MAX_COEFF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15300 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(153);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15400
     * @tc.desc   Test OH_NN_REDUCE_MIN_KEEP_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15400 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(154);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15500
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15500
     * @tc.desc   Test OH_NN_REDUCE_MIN_REDUCE_TO_END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15500 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(155);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15500 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15600
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15600
     * @tc.desc   Test OH_NN_REDUCE_MIN_COEFF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15600 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(156);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15700
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15700
     * @tc.desc   Test OH_NN_REDUCE_SUM_KEEP_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15700 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(157);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15800
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15800
     * @tc.desc   Test OH_NN_REDUCE_SUM_REDUCE_TO_END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15800 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(158);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15800 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType15900
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_15900
     * @tc.desc   Test OH_NN_REDUCE_SUM_COEFF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType15900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15900 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(159);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_15900 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType16000
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_16000
     * @tc.desc   Test OH_NN_REDUCE_L2_KEEP_DIMS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType16000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16000 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(160);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16000 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType16100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_16100
     * @tc.desc   Test OH_NN_REDUCE_L2_REDUCE_TO_END.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType16100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16100 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(161);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnTensorType16200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnTensorType_16200
     * @tc.desc   Test OH_NN_REDUCE_L2_COEFF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnTensorType16200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16200 start====");
          let result: number = neuralnetworkcoretest.HandleTensorOperations(162);
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnTensorType_16200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnQuantParam0100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnQuantParam_0100
     * @tc.desc   Test OH_NN_QuantParam-quantCount.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnQuantParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0100 start====");
          let result: number = neuralnetworkcoretest.OhNnQuantParamCode();
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnQuantParam0200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnQuantParam_0200
     * @tc.desc   Test OH_NN_QuantParam-numBits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnQuantParam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0200 start====");
          let result: number = neuralnetworkcoretest.OhNnQuantParamCode();
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnQuantParam0300
     * @tc.number SUB_NeuralNetworkRuntime_OhNnQuantParam_0300
     * @tc.desc   Test OH_NN_QuantParam-scale.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnQuantParam0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0300 start====");
          let result: number = neuralnetworkcoretest.OhNnQuantParamCode();
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnQuantParam0400
     * @tc.number SUB_NeuralNetworkRuntime_OhNnQuantParam_0400
     * @tc.desc   Test OH_NN_QuantParam-zeroPoint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnQuantParam0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0400 start====");
          let result: number = neuralnetworkcoretest.OhNnQuantParamCode();
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnQuantParam_0400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnMemoryCode0100
     * @tc.number SUB_NeuralNetworkRuntime_OhNnMemoryCode_0100
     * @tc.desc   Test OH_NN_UInt32Array-data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnMemoryCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnMemoryCode_0100 start====");
          let result: number = neuralnetworkcoretest.OhNnMemoryCode();
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnMemoryCode_0100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnMemoryCode_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   testNeuralNetworkRuntimeOhNnMemoryCode0200
     * @tc.number SUB_NeuralNetworkRuntime_OhNnMemoryCode_0200
     * @tc.desc   Test OH_NN_UInt32Array-size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNeuralNetworkRuntimeOhNnMemoryCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_NeuralNetworkRuntime_OhNnMemoryCode_0200 start====");
          let result: number = neuralnetworkcoretest.OhNnMemoryCode();
          expect(0).assertEqual(result);
          console.info("====>SUB_NeuralNetworkRuntime_OhNnMemoryCode_0200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_NeuralNetworkRuntime_OhNnMemoryCode_0200 catch err: " + err);
          done();
        }
      })
  })
}
