/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import bundle from '@ohos.bundle.bundleManager';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
let emitKey = "emitUserAgent";

export default function GaugeUxTest() {
  describe('GaugeUxTest', () => {

    beforeEach(async (done:Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/gaugeUx'
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get gaugeUx state success " + JSON.stringify(pages));
        if (!("gaugeUx" == pages.name)) {
          console.info("get gaugeUx state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gaugeUx page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gaugeUx page error " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("gaugeUx after each called");
    });




    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0100
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors attribute parameter to $r('app.color.gaugeColor1')
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0100');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0100 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Gauge_Colors_InterfaceName_0100 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0100 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FF0000FF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0100 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0200
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors attribute parameter to 0xffffff
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0200');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0200 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0200 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FFFFFFFF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0200 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0300
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors attribute parameter to "rgb(255,118,118)"
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0300');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0300 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0300 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FFFF7676");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0300 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0400
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors attribute parameter to Color.Pink
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0400');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0400 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0400 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FFFFC0CB");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0400 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0500
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors attribute parameter to "#FF7FFFAA"
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0500');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0500 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0500 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FF7FFFAA");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0500 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0600
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to $r('app.color.gaugeColor1'),
                and then set the colors property parameter to $r('app.color.gaugeColor2') again
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0600');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0600 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0600 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FF00FFFF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0600 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0700
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to " ",
                and then set the colors property parameter to "#FF0000FF" again
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0700');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0700 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0700 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FF0000FF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0700 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0800
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the Colors property parameter to ResourceColor type monochrome segmented display
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0800', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0800');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0800 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));

          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0800 API is not 11")
          } else {
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0][0][0]).assertEqual("#FFC0ECE5");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][1]).assertEqual(1);
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1][0][0][0]).assertEqual("#FF61CFBE");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1][1]).assertEqual(2);
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[2][0][0][0]).assertEqual("#FF64BB5C");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[2][1]).assertEqual(3);
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[3][0][0][0]).assertEqual("#FFDBEFA5");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[3][1]).assertEqual(4);
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0800 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_0900
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the Colors attribute parameter to LinearGradient type gradient segmentation display
     */
    it('ArkUX_Gauge_Colors_InterfaceName_0900', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0900');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0900 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));

          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0900 API is not 11")
          } else {
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0][0][0]).assertEqual("#66564AF7");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0][0][1]).substr(0, 3)).assertEqual("0.0");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0][1][0]).assertEqual("#FF564AF7");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0][1][1]).substr(0, 3)).assertEqual("1.0");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][1]).assertEqual(2);
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1][0][0][0]).assertEqual("#6646B1E3");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[1][0][0][1]).substr(0, 3)).assertEqual("0.0");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1][0][1][0]).assertEqual("#FF46B1E3");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[1][0][1][1]).substr(0, 3)).assertEqual("1.0");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1][1]).assertEqual(1);
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0900 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1000
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to "#6646B1E3",
                and then set the colors property parameter to undefined again
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1000', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1000');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1000 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1000 API is not 11")
          } else {

            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0]).assertEqual("#FF64BB5C");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1]).assertEqual("#FFF7CE00");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[2]).assertEqual("#FFE84026");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1000 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1100
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to 1
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1100');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1100 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FF000001");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Gauge_Colors_InterfaceName_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1200
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to an outlier -1
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1200');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1200 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1200 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FFFFFFFF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Gauge_Colors_InterfaceName_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1300
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to 0
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1300');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1300 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1300 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FF000000");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Gauge_Colors_InterfaceName_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1400
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to " "
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1400');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1400 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1400 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.colors).assertEqual("#FFE84026");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1400 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_1400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1500
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Do not set parameters for the colors property
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1500');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1500 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1500 API is not 11")
          } else {

            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0]).assertEqual("#FF64BB5C");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1]).assertEqual("#FFF7CE00");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[2]).assertEqual("#FFE84026");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1500 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_1500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1600
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to null
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1600', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1600');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1600 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1600 API is not 11")
          } else {

            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0]).assertEqual("#FF64BB5C");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1]).assertEqual("#FFF7CE00");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[2]).assertEqual("#FFE84026");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1600 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_1600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1700
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to undefined
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1700', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1700');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1700 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1700 API is not 11")
          } else {

            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0]).assertEqual("#FF64BB5C");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1]).assertEqual("#FFF7CE00");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[2]).assertEqual("#FFE84026");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1700 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_1700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1800
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to new LinearGradient([{ color: "#FFFFC0CB", offset: "aa"},
                {color: "#FF008000", offset: 0.5 }, {color: "#FFFF0000", offset: "" }])
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1800', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1800');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1800 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1800 API is not 11")
          } else {
            //
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0]).assertEqual("#FFFFC0CB");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[0][1]).substr(0, 3)).assertEqual("0.0");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1][0]).assertEqual("#FF008000");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[1][1]).substr(0, 3)).assertEqual("0.5");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1800 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_1800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_1900
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to new LinearGradient([{ color: "#FFFFC0CB", offset: "1px"},
                {color: "#FF008000", offset: "10vp" }, {color: "#FFFF0000", offset: "10%" }])
     */
    it('ArkUX_Gauge_Colors_InterfaceName_1900', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1900');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1900 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1900 API is not 11")
          } else {

            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0]).assertEqual("#FFFF0000");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[0][1]).substr(0, 3)).assertEqual("0.1");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1][0]).assertEqual("#FFFFC0CB");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[1][1]).substr(0, 3)).assertEqual("1.0");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1900 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_1900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_2000
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to new LinearGradient([{ color: "#FFFFC0CB", offset: 0},
                {color: "#FF008000", offset: 0 }, {color: "#FFFF0000", offset: 0 }])
     */
    it('ArkUX_Gauge_Colors_InterfaceName_2000', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_2000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_2000');
          console.info('ArkUX_Gauge_Colors_InterfaceName_2000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_2000 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_2000 API is not 11")
          } else {

            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0]).assertEqual("#FFFFC0CB");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[0][1]).substr(0, 3)).assertEqual("0.0");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_2000 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_2000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Colors_InterfaceName_2100
     *tc.name   Supports modifying the color of gauge components and supports segmented color settings
     *tc.desc   Set the colors property parameter to new LinearGradient([{ color: "#FFFFC0CB", offset: 0.9},
                {color: "#FF008000", offset: 0.6 }, {color: "#FFFF0000", offset: 0.2 }])
     */
    it('ArkUX_Gauge_Colors_InterfaceName_2100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_2000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_2100');
          console.info('ArkUX_Gauge_Colors_InterfaceName_2100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_2100 component JSON.parse(strJson).$attrs.colors is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.colors));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_2100 API is not 11")
          } else {

            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[0][0]).assertEqual("#FFFF0000");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[0][1]).substr(0, 3)).assertEqual("0.2");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[1][0]).assertEqual("#FF008000");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[1][1]).substr(0, 3)).assertEqual("0.6");
            expect(JSON.parse(JSON.parse(strJson).$attrs.colors)[2][0]).assertEqual("#FFFFC0CB");
            expect((JSON.parse(JSON.parse(strJson).$attrs.colors)[2][1]).substr(0, 3)).assertEqual("0.9");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_2100 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Colors_InterfaceName_2100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0100
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the indicator property parameter to {JSON.parse(strJson).$attrs.indicator.icon:'resources/base/media/icon1.svg',JSON.parse(strJson).$attrs.indicator.space:10}
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0100');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0100 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0100 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.indicator.icon).assertEqual("resources/base/media/icon1.svg");
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("10.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0100 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0200
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the indicator property parameter to {JSON.parse(strJson).$attrs.indicator.icon:$r('app.media.icon1'),JSON.parse(strJson).$attrs.indicator.space:5}
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0200');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0200 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0200 API is not 11")
          } else {
             expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("5.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0200 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0300
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the indicator property parameter to {JSON.parse(strJson).$attrs.indicator.icon:$r('app.media.icon1'),JSON.parse(strJson).$attrs.indicator.space:-5}
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0300');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0300 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0300 API is not 11")
          } else {
              expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0300 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0400
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the indicator property parameter to {JSON.parse(strJson).$attrs.indicator.icon:$r('app.media.icon1'),JSON.parse(strJson).$attrs.indicator.space:0}
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0400');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0400 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Gauge_Indicator_InterfaceName_0400 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0400 API is not 11")
          } else {  
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("0.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0400 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0500
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the indicator property parameter to {JSON.parse(strJson).$attrs.indicator.icon:'resources/base/media/JSON.parse(strJson).$attrs.indicator.icon.png',JSON.parse(strJson).$attrs.indicator.space:10},
                and then set the indicator property parameter to {JSON.parse(strJson).$attrs.indicator.icon:$r('app.media.icon1'),JSON.parse(strJson).$attrs.indicator.space:5} again
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0500');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0500 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0500 API is not 11")
          } else {       
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("5.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0500 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0600
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the indicator property parameter to " ",
                and then set the indicator property parameter to {JSON.parse(strJson).$attrs.indicator.icon:$r('app.media.icon1'),JSON.parse(strJson).$attrs.indicator.space:5} again
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0600');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0600 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0600 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("5.00vp");
          }
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0700
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the indicator property parameter to {JSON.parse(strJson).$attrs.indicator.icon:'resources/base/media/icon1.svg',JSON.parse(strJson).$attrs.indicator.space:10},
                and then set the indicator property parameter to " " again
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0700');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0700 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0700 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0700 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0800
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the indicator property parameter to 1
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0800', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0800');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0800 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0800 API is not 11")
          } else {
          
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("8.00vp");

          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0800 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_0900
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the description property parameter to -1
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_0900', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0900');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0900 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0900 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("8.00vp");  
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0900 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_1000
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the description property parameter to 0
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_1000', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1000');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1000 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1000 API is not 11")
          } else {
           
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("8.00vp");

          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1000 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_1100
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the description property parameter to " "
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_1100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1100');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1100 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1100 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1100 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_1200
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Do not set parameters for the indicator property
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_1200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1200');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1200 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1200 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1200 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_1300
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the description property parameter to null
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_1300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1300');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1300 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1300 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.indicator).assertEqual("null");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1300 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_Indicator_InterfaceName_1400
     *tc.name   Support for setting the pointer style of the gauge component
     *tc.desc   Set the description property parameter to undefined
     */
    it('ArkUX_Gauge_Indicator_InterfaceName_1400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1400');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1400 component JSON.parse(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.indicator));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1400 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.indicator.space).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1400 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0100
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to {radius:10,offsetX:10,offsetY:10}
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0100');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0100 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0100 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0100 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0200
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to {radius:-10,offsetX:-10,offsetY:-10}
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0200');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0200 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0200 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("-10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("-10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0200 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0300
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to {radius:0,offsetX:0,offsetY:0}
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0300');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0300 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0300 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("0.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("0.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0300 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0400
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to
                {radius:$r('app.string.num'),offsetX:$r('app.string.num'),offsetY:$r('app.string.num')}
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0400');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0400 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0400 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0400 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0500
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to {radius:10,offsetX:10,offsetY:10},
                and then set the trackShadow property parameter to {radius:-10,offsetX:-10,offsetY:-10} again
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0500');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0500 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0500 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("-10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("-10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0500 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0600
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to " ",
                and then set the trackShadow property parameter to {radius:-10,offsetX:-10,offsetY:-10} again
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0600');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0600 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0600 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("-10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("-10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0600 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0700
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to {radius:10,offsetX:10,offsetY:10},
                and then set the trackShadow property parameter to " " again
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0700');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0700 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0700 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("5.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0700 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0800
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to 1
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0800', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0800');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0800 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0800 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("5.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0800 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_0900
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to -1
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_0900', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0900');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0900 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0900 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("5.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0900 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_1000
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to 0
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_1000', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1000');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1000 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1000 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("5.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1000 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_1100
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to " "
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_1100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1100');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1100 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1100 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("5.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1100 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_1200
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Do not set parameters for the trackShadow property
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_1200', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1200');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1200 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1200 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("5.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1200 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_1300
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to null
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_1300', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1300');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1300 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1300 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow).assertEqual("null");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1300 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_1400
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to undefined
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_1400', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1400');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1400 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1400 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("20.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("5.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });


    /*
     *tc.number ArkUX_Gauge_TrackShadow_InterfaceName_1500
     *tc.name   Support for modifying the shadow style of gauge components
     *tc.desc   Set the trackShadow property parameter to {radius:10,offsetX:10,offsetY:undefined}
     */
    it('ArkUX_Gauge_TrackShadow_InterfaceName_1500', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1500');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1500 component JSON.parse(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.trackShadow));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1500 API is not 11")
          } else {
            expect(JSON.parse(strJson).$attrs.trackShadow.radius).assertEqual("10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetX).assertEqual("10.000000");
            expect(JSON.parse(strJson).$attrs.trackShadow.offsetY).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1500 END ');
        } catch (err) {
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      }, 1000)
    });

  })
}