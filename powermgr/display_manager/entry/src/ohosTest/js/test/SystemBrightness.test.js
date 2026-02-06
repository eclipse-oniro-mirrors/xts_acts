/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import brightness from '@system.brightness';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function SystemBrightnessTest() {
  describe('SystemBrightnessTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SystemBrightnessTest_0100
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0010
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SystemBrightnessTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done) => {
      let TAG = 'SystemBrightnessTest_0100';
      brightness.getValue({
        success: (brightnessResponse) => {
          console.info(`${TAG} brightnessResponse.value:${brightnessResponse.value}`);
          expect(brightnessResponse.value).assertLargerOrEqual(0);
          expect(brightnessResponse.value).assertLessOrEqual(255);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} getValue complete`);
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_0200
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0020
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_0200';
      brightness.getValue({
        success: (brightnessResponse) => {
          console.info(`${TAG} brightnessResponse.value:${brightnessResponse.value}`);
          expect(brightnessResponse.value).assertLargerOrEqual(0);
          expect(brightnessResponse.value).assertLessOrEqual(255);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_0300
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0030
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_0300';
      brightness.getValue({
        success: (brightnessResponse) => {
          console.info(`${TAG} brightnessResponse.value:${brightnessResponse.value}`);
          expect(brightnessResponse.value).assertLargerOrEqual(0);
          expect(brightnessResponse.value).assertLessOrEqual(255);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_0400
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0040
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_0400';
      brightness.getValue({
        success: (brightnessResponse) => {
          console.info(`${TAG} brightnessResponse.value:${brightnessResponse.value}`);
          expect(brightnessResponse.value).assertLargerOrEqual(0);
          expect(brightnessResponse.value).assertLessOrEqual(255);
          done();
        },
        complete: () => {
          console.info(`${TAG} getValue complete`);
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_0500
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0050
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_0500';
      brightness.getValue({
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} getValue complete`);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_0600
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0060
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let TAG = 'SystemBrightnessTest_0600';
      brightness.getValue({
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_0700
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0070
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let TAG = 'SystemBrightnessTest_0700';
      brightness.getValue({
        complete: () => {
          console.info(`${TAG} getValue complete`);
          expect(TAG).assertContain('Brightness');
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_0800
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0080
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_0800';
      brightness.setValue({
        value: 128,
        success: () => {
          console.info(`${TAG} setValue success!`);
          brightness.getValue({
            success: (brightnessResponse) => {
              console.info(`${TAG} brightnessResponse.value:${brightnessResponse.value}`);
              expect(brightnessResponse.value).assertLargerOrEqual(0);
              expect(brightnessResponse.value).assertLessOrEqual(255);
              done();
            }
          });
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(202).assertEqual(code);
          done();
        },
        complete: () => {
          console.info(`${TAG} setValue complete!`);
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_0900
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0090
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_0900';
      brightness.setValue({
        value: 128,
        success: () => {
          console.info(`${TAG} setValue success!`);
          brightness.getValue({
            success: (brightnessResponse) => {
              console.info(`${TAG} brightnessResponse.value:${brightnessResponse.value}`);
              expect(brightnessResponse.value).assertLargerOrEqual(0);
              expect(brightnessResponse.value).assertLessOrEqual(255);
              done();
            }
          });
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(202).assertEqual(code);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1000
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0100
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1000';
      brightness.setValue({
        value: 128,
        success: () => {
          console.info(`${TAG} setValue success!`);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(202).assertEqual(code);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1100
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0110
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1100';
      brightness.setValue({
        value: 128,
        success: () => {
          console.info(`${TAG} setValue success!`);
          brightness.getValue({
            success: (brightnessResponse) => {
              console.info(`${TAG} brightnessResponse.value:${brightnessResponse.value}`);
              expect(brightnessResponse.value).assertLargerOrEqual(0);
              expect(brightnessResponse.value).assertLessOrEqual(255);
              done();
            }
          });
        },
        complete: () => {
          console.info(`${TAG} setValue complete`);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1200
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0120
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1200';
      brightness.setValue({
        value: 128,
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(202).assertEqual(code);
          done();
        },
        complete: () => {
          console.info(`${TAG} setValue complete`);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1300
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0130
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let TAG = 'SystemBrightnessTest_1300';
      brightness.setValue({
        value: 128,
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(202).assertEqual(code);
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1310
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0131
     * @tc.desc   Set brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1310';
      try {
        brightness.setValue();
        console.info(`${TAG} setValue!`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SystemBrightnessTest_1400
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0140
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1400';
      brightness.getMode({
        success: (brightnessModeResponse) => {
          console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
          expect(brightnessModeResponse.mode).assertLargerOrEqual(0);
          expect(brightnessModeResponse.mode).assertLessOrEqual(1);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} getValue complete`);
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1500
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0150
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1500';
      brightness.getMode({
        success: (brightnessModeResponse) => {
          console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
          expect(brightnessModeResponse.mode).assertLargerOrEqual(0);
          expect(brightnessModeResponse.mode).assertLessOrEqual(1);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1600
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0160
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1600';
      brightness.getMode({
        success: (brightnessModeResponse) => {
          console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
          expect(brightnessModeResponse.mode).assertLargerOrEqual(0);
          expect(brightnessModeResponse.mode).assertLessOrEqual(1);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1700
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0170
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1700';
      brightness.getMode({
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} getValue complete`);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1800
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0180
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let TAG = 'SystemBrightnessTest_1800';
      brightness.getMode({
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1900
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_1900
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1900';
      brightness.getMode({
        success: (brightnessModeResponse) => {
          console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
          expect(brightnessModeResponse.mode).assertLargerOrEqual(0);
          expect(brightnessModeResponse.mode).assertLessOrEqual(1);
          done();
        },
        complete: () => {
          console.info(`${TAG} getValue complete`);
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_1910
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0191
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_1910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_1910';
      try {
        brightness.getMode();
        console.info(`${TAG} getMode!`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SystemBrightnessTest_2000
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0200
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2000';
      brightness.setMode({
        mode: 1,
        success: () => {
          console.info(`${TAG} setMode success`);
          brightness.getMode({
            success: (brightnessModeResponse) => {
              console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
              expect(brightnessModeResponse.mode).assertEqual(1);
              done();
            }
          })
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(code).assertEqual(200);
          done();
        },
        complete: () => {
          console.info(`${TAG} setMode complete`);
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_2100
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0210
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2100';
      brightness.setMode({
        mode: TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
        success: () => {
          console.info(`${TAG} setMode success`);
          brightness.getMode({
            success: (brightnessModeResponse) => {
              console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
              expect(brightnessModeResponse.mode).assertEqual(0);
              done();
            }
          });
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(code).assertEqual(200);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_2200
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0220
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let TAG = 'SystemBrightnessTest_2200';
      brightness.setMode({
        mode: 1,
        success: () => {
          console.info(`${TAG} setMode success`);
          brightness.getMode({
            success: (brightnessModeResponse) => {
              console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
              expect(brightnessModeResponse.mode).assertEqual(1);
            }
          });
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_2300
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0230
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2300';
      brightness.setMode({
        mode: 1,
        success: () => {
          console.info(`${TAG} setMode success`);
          brightness.getMode({
            success: (brightnessModeResponse) => {
              console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
              expect(brightnessModeResponse.mode).assertEqual(1);
              done();
            }
          });
        },
        complete: () => {
          console.info(`${TAG} setMode complete`);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_2400
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0240
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2400';
      brightness.setMode({
        mode: 1,
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(code).assertEqual(200);
          done();
        },
        complete: () => {
          console.info(`${TAG} setMode complete`);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_2410
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0241
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2410';
      try {
        brightness.setMode();
        console.info(`${TAG} setMode!`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SystemBrightnessTest_2500
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0250
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2500';
      brightness.setKeepScreenOn({
        keepScreenOn: true,
        success: () => {
          console.info(`${TAG} setKeepScreenOn success`);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(code).assertEqual(202);
          done();
        },
        complete: () => {
          console.info(`${TAG} setKeepScreenOn complete`);
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_2600
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0260
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2600';
      brightness.setKeepScreenOn({
        keepScreenOn: false,
        success: () => {
          console.info(`${TAG} setKeepScreenOn success`);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(code).assertEqual(202);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_2700
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0270
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2700';
      brightness.setKeepScreenOn({
        keepScreenOn: true,
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(code).assertEqual(202);
          done();
        },
        complete: () => {
          console.info(`${TAG} setKeepScreenOn complete`);
          done();
        }
      });
    });

    /**
     * @tc.name   SystemBrightnessTest_2710
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0271
     * @tc.desc   Get brightness success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SystemBrightnessTest_2710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'SystemBrightnessTest_2710';
      try {
        brightness.setKeepScreenOn();
        console.info(`${TAG} setKeepScreenOn!`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}
