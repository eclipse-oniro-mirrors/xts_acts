/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium'
import Curves from '@ohos.curves'
import router from '@ohos.router';
let abc: ESObject
function interpolate3(fraction: string): ESObject {
  interpolate4(fraction)
  return abc
}
function interpolate4(fraction: string) {
  abc = fraction
}
export default function animationCurveTest() {
  describe('animationCurveTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/animationCurve',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get animationCurve state success " + JSON.stringify(pages));
        if (!("animationCurve" == pages.name)) {
          console.info("get animationCurve state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push animationCurve page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push animationCurve page error: " + err);
      }
      done()
    });
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
     * @tc.name   ArkUX_ohos.curves_customCurve_1000
     * @tc.number ArkUX_ohos.curves_customCurve_1000
     * @tc.desc   ArkUX_ohos.curves_customCurve_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_ohos.curves_customCurve_1000', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1000 START');
      let fraction: ESObject
      setTimeout(() => {
        try {
          fraction = Curves.customCurve((fraction: number) => {
            return fraction
          }).interpolate(0.1).toFixed(4)
          let finalRes: boolean
          if (fraction == 0.1000) {
            finalRes = true;
          } else {
            finalRes = false;
          }
          expect(finalRes).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_ohos.curves_customCurve_1100
     * @tc.number ArkUX_ohos.curves_customCurve_1100
     * @tc.desc   ArkUX_ohos.curves_customCurve_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_ohos.curves_customCurve_1100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1000 START');
      let fraction1: ESObject
      setTimeout(() => {
        try {
          fraction1 = Curves.customCurve((fraction: number) => {
            return 2 * fraction
          }).interpolate(0.1).toFixed(4)
          console.info("curves_customCurve_1100", fraction1)
          let finalRes1: boolean
          if (fraction1 == 0.2000) {
            finalRes1 = true;
          } else {
            finalRes1 = false;
          }
          expect(finalRes1).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_ohos.curves_customCurve_1200
     * @tc.number ArkUX_ohos.curves_customCurve_1200
     * @tc.desc   ArkUX_ohos.curves_customCurve_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_ohos.curves_customCurve_1200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1200 START');
      let fraction2: ESObject
      setTimeout(() => {
        try {
          fraction2 = Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(0.1).toFixed(4)
          console.info("curves_customCurve_1200", fraction2)
          let finalRes2: boolean
          if (fraction2 == 0.0100) {
            finalRes2 = true;
          } else {
            finalRes2 = false;
          }
          expect(finalRes2).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_ohos.curves_customCurve_1300
     * @tc.number ArkUX_ohos.curves_customCurve_1300
     * @tc.desc   ArkUX_ohos.curves_customCurve_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_ohos.curves_customCurve_1300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1300 START');
      let fraction3: ESObject
      let fraction4: ESObject
      setTimeout(() => {
        try {
          fraction3 = Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(0.1).toFixed(4)
          fraction4 = Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(0.1).toFixed(4)
          console.info("curves_customCurve_1300", fraction3)
          let finalRes3: boolean
          if (fraction3 == 0.0100 && fraction4 == 0.0100) {
            finalRes3 = true;
          } else {
            finalRes3 = false;
          }
          expect(finalRes3).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_ohos.curves_customCurve_1400
     * @tc.number ArkUX_ohos.curves_customCurve_1400
     * @tc.desc   ArkUX_ohos.curves_customCurve_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_ohos.curves_customCurve_1400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1400 START');
      let fraction5: ESObject
      setTimeout(() => {
        try {
          fraction5 = Curves.customCurve(interpolate3('fraction')).interpolate(0.1).toFixed(4)
          console.info('ArkUX_ohos.curves_customCurve_14005 ' + fraction5);
          let finalRes5: boolean
          if (fraction5 == 0.1000) {
            finalRes5 = true;
          } else {
            finalRes5 = false;
          }
          expect(finalRes5).assertEqual(true);
        } catch (err) {
        }
        done();
      }, 1000)
    });

    /**
     * @tc.name customCurve_1500
     * @tc.number customCurve_1500
     * @tc.desc customCurve_1500 test 0
     * @tc.level Level 0
     */
    it('customCurve_1500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1400 START');
      let fraction5: ESObject
      setTimeout(() => {
        try {
          fraction5 = Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(0).toFixed(4)
          console.info("customCurve_1500", fraction5)
          let finalRes2: boolean
          if (fraction5 == 0.0000) {
            finalRes2 = true;
          } else {
            finalRes2 = false;
          }
          expect(finalRes2).assertEqual(true);
        } catch (err) {
          console.log('customCurve_1500', err)
        }
        done();
      }, 500)
    });

    /**
     * @tc.name customCurve_1600
     * @tc.number customCurve_1600
     * @tc.desc customCurve_1600 test 1
     * @tc.level Level 0
     */
    it('customCurve_1600', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1400 START');
      let fraction5: ESObject
      setTimeout(() => {
        try {
          fraction5 = Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(1).toFixed(4)
          console.info("customCurve_1600", fraction5)
          let finalRes2: boolean
          if (fraction5 == 1.0000) {
            finalRes2 = true;
          } else {
            finalRes2 = false;
          }
          expect(finalRes2).assertEqual(true);
        } catch (err) {
          console.log('customCurve_1600', err)
        }
        done();
      }, 500)
    });

    /**
     * @tc.name customCurve_1700
     * @tc.number customCurve_1700
     * @tc.desc customCurve_1700 test 2
     * @tc.level Level 0
     */
    it('customCurve_1700', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1400 START');
      let fraction5: ESObject
      setTimeout(() => {
        try {
          fraction5 = Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(2).toFixed(4)
          console.info("customCurve_1700", fraction5)
          let finalRes2: boolean
          if (fraction5 == 1.0000) {
            finalRes2 = true;
          } else {
            finalRes2 = false;
          }
          expect(finalRes2).assertEqual(true);
        } catch (err) {
          console.log('customCurve_1700', err)
        }
        done();
      }, 500)
    });

    /**
     * @tc.name customCurve_1800
     * @tc.number customCurve_1800
     * @tc.desc customCurve_1800 test -1
     * @tc.level Level 0
     */
    it('customCurve_1800', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_ohos.curves_customCurve_1400 START');
      let fraction5: ESObject
      setTimeout(() => {
        try {
          fraction5 = Curves.customCurve((fraction: number) => {
            return fraction * fraction
          }).interpolate(-1).toFixed(4)
          console.info("customCurve_1800", fraction5)
          let finalRes2: boolean
          if (fraction5 == 0.0000) {
            finalRes2 = true;
          } else {
            finalRes2 = false;
          }
          expect(finalRes2).assertEqual(true);
        } catch (err) {
          console.log('customCurve_1800', err)
        }
        done();
      }, 500)
    });
  })
}