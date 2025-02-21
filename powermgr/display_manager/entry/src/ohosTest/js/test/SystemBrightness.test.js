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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0010
     * @tc.name testSystemBrightnessTest_0100
     * @tc.desc Get brightness success
     * @tc.level: Level 1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0100', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0020
     * @tc.name testSystemBrightnessTest_0200
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0200', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0030
     * @tc.name testSystemBrightnessTest_0300
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0300', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0040
     * @tc.name testSystemBrightnessTest_0400
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0400', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0050
     * @tc.name testSystemBrightnessTest_0500
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0500', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0060
     * @tc.name testSystemBrightnessTest_0600
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0600', 0, () => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0070
     * @tc.name testSystemBrightnessTest_0700
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0700', 0, () => {
      let TAG = 'SystemBrightnessTest_0700';
      brightness.getValue({
        complete: () => {
          console.info(`${TAG} getValue complete`);
          expect(TAG).assertContain('Brightness');
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0080
     * @tc.name testSystemBrightnessTest_0800
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0800', 0, async (done) => {
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
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} setValue complete!`);
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0090
     * @tc.name testSystemBrightnessTest_0900
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_0900', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0100
     * @tc.name testSystemBrightnessTest_1000
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1000', 0, async (done) => {
      let TAG = 'SystemBrightnessTest_1000';
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
          done();
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0110
     * @tc.name testSystemBrightnessTest_1100
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1100', 0, async (done) => {
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
          done();
        },
        complete: () => {
          console.info(`${TAG} setValue complete`);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0120
     * @tc.name testSystemBrightnessTest_1200
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1200', 0, async (done) => {
      let TAG = 'SystemBrightnessTest_1200';
      brightness.setValue({
        value: 128,
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} setValue complete`);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0130
     * @tc.name testSystemBrightnessTest_1300
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1300', 0, () => {
      let TAG = 'SystemBrightnessTest_1300';
      brightness.setValue({
        value: 128,
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0140
     * @tc.name testSystemBrightnessTest_1400
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1400', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0150
     * @tc.name testSystemBrightnessTest_1500
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1500', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0160
     * @tc.name testSystemBrightnessTest_1600
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1600', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0170
     * @tc.name testSystemBrightnessTest_1700
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1700', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0180
     * @tc.name testSystemBrightnessTest_1800
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1800', 0, () => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_1900
     * @tc.name testSystemBrightnessTest_1900
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_1900', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0200
     * @tc.name testSystemBrightnessTest_2000
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_2000', 0, async (done) => {
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
          done();
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0210
     * @tc.name testSystemBrightnessTest_2100
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_2100', 0, async (done) => {
      let TAG = 'SystemBrightnessTest_2100';
      brightness.setMode({
        mode: 0,
        success: () => {
          console.info(`${TAG} setMode success`);
          brightness.getMode({
            success: (brightnessModeResponse) => {
              console.info(`${TAG} brightnessModeResponse.mode:${brightnessModeResponse.mode}`);
              expect(brightnessModeResponse.mode).assertEqual(0);
              done();
            }
          });
          done();
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0220
     * @tc.name testSystemBrightnessTest_2200
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_2200', 0, () => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0230
     * @tc.name testSystemBrightnessTest_2300
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_2300', 0, async (done) => {
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
          done();
        },
        complete: () => {
          console.info(`${TAG} setMode complete`);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0240
     * @tc.name testSystemBrightnessTest_2400
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_2400', 0, async (done) => {
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
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0250
     * @tc.name testSystemBrightnessTest_2500
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_2500', 0, async (done) => {
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
          expect(code).assertEqual(200);
          done();
        },
        complete: () => {
          console.info(`${TAG} setKeepScreenOn complete`);
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0260
     * @tc.name testSystemBrightnessTest_2600
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_2600', 0, async (done) => {
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
          expect(code).assertEqual(200);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0270
     * @tc.name testSystemBrightnessTest_2700
     * @tc.desc Get brightness success
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('SystemBrightnessTest_2700', 0, async (done) => {
      let TAG = 'SystemBrightnessTest_2700';
      brightness.setKeepScreenOn({
        keepScreenOn: true,
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect(code).assertEqual(200);
          done();
        },
        complete: () => {
          console.info(`${TAG} setKeepScreenOn complete`);
          done();
        }
      });
    });
  })
}
