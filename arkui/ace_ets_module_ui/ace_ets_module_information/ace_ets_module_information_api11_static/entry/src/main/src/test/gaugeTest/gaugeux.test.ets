'use static';
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
import bundle from '@ohos.bundle.bundleManager';
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import accessibility from '@ohos.accessibility';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitUserAgent";

export default function GaugeUxTest() {
  describe('GaugeUxTest', () => {
    beforeAll(() => {
      console.info("GaugeUxTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/gaugeUx'
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gaugeUx state success " + JSON.stringify(pages));
        if (!("gaugeUx" == pages.name)) {
          console.info("get gaugeUx state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gaugeUx page error " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("gaugeUx after each called");
    });

    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0100
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0100
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0100 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0100');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0100 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Gauge_Colors_InterfaceName_0100 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0100 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FF0000FF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0100 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0200
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0200
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0200 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0200');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0200 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0200 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FFFFFFFF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0200 END ');

        done();
      }, 1000)
    });
    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0300
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0300
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0300 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0300');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0300 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0300 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FFFF7676");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0300 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0400
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0400
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0400 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0400');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0400 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0400 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FFFFC0CB");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0400 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0500
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0500
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0500 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0500');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0500 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0500 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FF7FFFAA");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0500 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0600
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0600
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0600 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0600');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0600 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0600 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FF00FFFF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0600 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0700
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0700
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0700 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0700');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0700 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0700 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FF0000FF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0700 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0800
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0800
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0800 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0800');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0800 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0800 API is not 11")
          } else {
            console.log('ArkUX_Gauge_Colors_InterfaceName_0800 array',colorsAry.asArray()[0].asArray()[0].asArray()[0].asArray()[0].asString())
            expect(colorsAry.asArray()[0].asArray()[0].asArray()[0].asArray()[0].asString()).assertEqual("#FFC0ECE5");
            expect(colorsAry.asArray()[0].asArray()[1].asDouble()).assertEqual(1);
            expect(colorsAry.asArray()[1].asArray()[0].asArray()[0].asArray()[0].asString()).assertEqual("#FF61CFBE");
            expect(colorsAry.asArray()[1].asArray()[1].asDouble()).assertEqual(2);
            expect(colorsAry.asArray()[2].asArray()[0].asArray()[0].asArray()[0].asString()).assertEqual("#FF64BB5C");
            expect(colorsAry.asArray()[2].asArray()[1].asDouble()).assertEqual(3);
            expect(colorsAry.asArray()[3].asArray()[0].asArray()[0].asArray()[0].asString()).assertEqual("#FFDBEFA5");
            expect(colorsAry.asArray()[3].asArray()[1].asDouble()).assertEqual(4);
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0800 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_0900
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_0900
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_0900 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_0900');
          console.info('ArkUX_Gauge_Colors_InterfaceName_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_0900 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0900 API is not 11")
          } else {
            console.info("ArkUX_Gauge_Colors_InterfaceName_0900 API is not 11",colorsAry.asArray()[0].asArray()[0].asArray()[0].asArray()[1].asString().substr(0, 3))
           expect(colorsAry.asArray()[0].asArray()[0].asArray()[0].asArray()[0].asString()).assertEqual("#66564AF7");
            expect(colorsAry.asArray()[0].asArray()[0].asArray()[0].asArray()[1].asString().substr(0, 3)).assertEqual("0.0");
            expect(colorsAry.asArray()[0].asArray()[0].asArray()[1].asArray()[0].asString()).assertEqual("#FF564AF7");
            expect(colorsAry.asArray()[0].asArray()[0].asArray()[1].asArray()[1].asString().substr(0, 3)).assertEqual("1.0");
            expect(colorsAry.asArray()[0].asArray()[1].asDouble()).assertEqual(2);
            expect(colorsAry.asArray()[1].asArray()[0].asArray()[0].asArray()[0].asString()).assertEqual("#6646B1E3");
            expect(colorsAry.asArray()[1].asArray()[0].asArray()[0].asArray()[1].asString().substr(0, 3)).assertEqual("0.0");
            expect(colorsAry.asArray()[1].asArray()[0].asArray()[1].asArray()[0].asString()).assertEqual("#FF46B1E3");
            expect(colorsAry.asArray()[1].asArray()[0].asArray()[1].asArray()[1].asString().substr(0, 3)).assertEqual("1.0");
            expect(colorsAry.asArray()[1].asArray()[1].asDouble()).assertEqual(1);

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_0900 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1000
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1000
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1000 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1000');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1000 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1000 API is not 11")
          } else {
            expect(colorsAry.asArray()[0].asString()).assertEqual("#FF64BB5C");
            expect(colorsAry.asArray()[1].asString()).assertEqual("#FFF7CE00");
            expect(colorsAry.asArray()[2].asString()).assertEqual("#FFE84026");

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1000 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1100
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1100
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1100 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1100');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1100 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FF000001");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1100 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1200
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1200
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1200 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1200');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1200 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1200 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FFFFFFFF");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1200 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1300
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1300
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1300 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1300');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1300 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1300 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FF000000");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1300 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1400
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1400
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1400 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1400');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1400 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1400 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')).assertEqual("#FFE84026");
          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1400 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1500
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1500
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1500 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1500');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1500 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1500 API is not 11")
          } else {

            expect(colorsAry.asArray()[0].asString()).assertEqual("#FF64BB5C");
            expect(colorsAry.asArray()[1].asString()).assertEqual("#FFF7CE00");
            expect(colorsAry.asArray()[2].asString()).assertEqual("#FFE84026");

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1500 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1600
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1600
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1600 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1600');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1600 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1600 API is not 11")
          } else {
            expect(colorsAry.asArray()[0].asString()).assertEqual("#FF64BB5C");
            expect(colorsAry.asArray()[1].asString()).assertEqual("#FFF7CE00");
            expect(colorsAry.asArray()[2].asString()).assertEqual("#FFE84026");

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1600 END ');

        done();
      }, 1000)
    });

    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1700
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1700
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1700 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1700');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1700 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1700 API is not 11")
          } else {
            expect(colorsAry.asArray()[0].asString()).assertEqual("#FF64BB5C");
            expect(colorsAry.asArray()[1].asString()).assertEqual("#FFF7CE00");
            expect(colorsAry.asArray()[2].asString()).assertEqual("#FFE84026");

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1700 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1800
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1800
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1800 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1800');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1800 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1800 API is not 11")
          } else {
            expect(colorsAry.asArray()[0].asArray()[0].asString()).assertEqual("#FFFFC0CB");
            expect(colorsAry.asArray()[0].asArray()[1].asString().substr(0, 3)).assertEqual("0.0");
            expect(colorsAry.asArray()[1].asArray()[0].asString()).assertEqual("#FF008000");
            expect(colorsAry.asArray()[1].asArray()[1].asString().substr(0, 3)).assertEqual("0.5");

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1800 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_1900
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_1900
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_1900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_1900 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_1900');
          console.info('ArkUX_Gauge_Colors_InterfaceName_1900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_1900 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_1900 API is not 11")
          } else {
            expect(colorsAry.asArray()[0].asArray()[0].asString()).assertEqual("#FFFF0000");
            expect(colorsAry.asArray()[0].asArray()[1].asString().substr(0, 3)).assertEqual("0.1");
            expect(colorsAry.asArray()[1].asArray()[0].asString()).assertEqual("#FFFFC0CB");
            expect(colorsAry.asArray()[1].asArray()[1].asString().substr(0, 3)).assertEqual("1.0");

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_1900 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_2000
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_2000
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_2000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_2000 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_2000');
          console.info('ArkUX_Gauge_Colors_InterfaceName_2000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_2000 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_2000 API is not 11")
          } else {
            expect(colorsAry.asArray()[0].asArray()[0].asString()).assertEqual("#FFFFC0CB");
            expect(colorsAry.asArray()[0].asArray()[1].asString().substr(0, 3)).assertEqual("0.0");

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_2000 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Colors_InterfaceName_static_2100
     * @tc.name     ArkUX_Gauge_Colors_InterfaceName_static_2100
     * @tc.desc     ArkUX_Gauge_Colors_InterfaceName_static_2100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Colors_InterfaceName_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Colors_InterfaceName_2000 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Colors_InterfaceName_2100');
          console.info('ArkUX_Gauge_Colors_InterfaceName_2100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Colors_InterfaceName_2100 component JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('colors')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
        let attrs = JSON.parseJsonElement(strJson).getElement('$attrs')
        let colorsAry = JSON.parseJsonElement(attrs.getString('colors'))
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Colors_InterfaceName_2100 API is not 11")
          } else {
            expect(colorsAry.asArray()[0].asArray()[0].asString()).assertEqual("#FFFF0000");
            expect(colorsAry.asArray()[0].asArray()[1].asString().substr(0, 3)).assertEqual("0.2");
            expect(colorsAry.asArray()[1].asArray()[0].asString()).assertEqual("#FF008000");
            expect(colorsAry.asArray()[1].asArray()[1].asString().substr(0, 3)).assertEqual("0.6");
            expect(colorsAry.asArray()[2].asArray()[0].asString()).assertEqual("#FFFFC0CB");
            expect(colorsAry.asArray()[2].asArray()[1].asString().substr(0, 3)).assertEqual("0.9");

          }
          console.info('ArkUX_Gauge_Colors_InterfaceName_2100 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0100
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0100
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0100 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0100');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0100 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0100 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('icon')).assertEqual("resources/base/media/icon1.svg");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("10.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0100 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0200
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0200
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0200 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0200');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0200 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0200 API is not 11")
          } else {
             expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("5.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0200 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0300
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0300
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0300 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0300');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0300 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0300 API is not 11")
          } else {
              expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0300 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0400
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0400
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0400 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0400');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0400 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Gauge_Indicator_InterfaceName_0400 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0400 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("0.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0400 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0500
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0500
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0500 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0500');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0500 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0500 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("5.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0500 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0600
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0600
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0600 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0600');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0600 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0600 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("5.00vp");
          }

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0700
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0700
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0700 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0700');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0700 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0700 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0700 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0800
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0800
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0800 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0800');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0800 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0800 API is not 11")
          } else {

            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("8.00vp");

          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0800 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_0900
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_0900
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_0900 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_0900');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_0900 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_0900 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_0900 END ');

        done();
      }, 1000)
    });

    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_1000
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_1000
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1000 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1000');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1000 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1000 API is not 11")
          } else {

            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("8.00vp");

          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1000 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_1100
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_1100
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1100 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1100');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1100 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1100 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1100 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_1200
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_1200
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1200 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1200');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1200 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1200 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("8.00vp");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1200 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_1300
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_1300
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1300 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1300');
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_Indicator_InterfaceName_1300 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_Indicator_InterfaceName_1300 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator')).assertEqual("null");
          }
          console.info('ArkUX_Gauge_Indicator_InterfaceName_1300 END ');
        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_Indicator_InterfaceName_static_1400
     * @tc.name     ArkUX_Gauge_Indicator_InterfaceName_static_1400
     * @tc.desc     ArkUX_Gauge_Indicator_InterfaceName_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_Indicator_InterfaceName_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_Indicator_InterfaceName_1400 START');
     try{
       setTimeout(() => {
         let strJson = inspector.getInspectorByKey('ArkUX_Gauge_Indicator_InterfaceName_1400');
         console.info('ArkUX_Gauge_Indicator_InterfaceName_1400 START  :' + JSON.stringify(strJson));

         console.info("ArkUX_Gauge_Indicator_InterfaceName_1400 component JSON.parseJsonElement(strJson).$attrs.indicator is: " +
         JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
         let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
         if (targetVersion < 11) {
           console.info("ArkUX_Gauge_Indicator_InterfaceName_1400 API is not 11")
         } else {
           expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator').getString('space')).assertEqual("8.00vp");
         }
         console.info('ArkUX_Gauge_Indicator_InterfaceName_1400 END ');

         done();
       }, 1000)
     }catch(e){
       console.info('ArkUX_Gauge_Indicator_InterfaceName_1400 error  :' + JSON.stringify(e));
       done();
     }
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0100
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0100
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0100 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0100');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0100 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0100 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0100 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0200
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0200
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0200 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0200');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0200 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0200 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("-10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("-10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0200 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0300
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0300
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0300 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0300');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0300 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0300 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("0.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("0.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0300 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0400
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0400
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0400 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0400');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0400 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0400 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0400 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0500
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0500
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0500 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0500');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0500 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0500 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("-10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("-10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0500 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0600
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0600
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0600 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0600');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0600 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0600 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0600 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("-10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("-10.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0600 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0700
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0700
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0700 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0700');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0700 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0700 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0700 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0700 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0800
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0800
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0800 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0800');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0800 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0800 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0800 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0800 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_0900
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_0900
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0900 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_0900');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0900 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0900 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_0900 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_0900 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_1000
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_1000
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1000 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1000');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1000 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1000 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1000 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1000 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_1100
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_1100
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1100 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1100');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1100 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1100 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1100 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1100 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_1200
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_1200
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1200 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1200');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1200 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1200 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1200 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1200 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_1300
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_1300
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1300 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1300');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1300 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1300 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1300 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetString('trackShadow')).assertEqual('null');
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1300 END ');

        done();
      }, 1000)
    });


    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_1400
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_1400
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 START');
      try{
        setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1400');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1400 component JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1400 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 END ');

          done();
        }, 1000)
      }catch(e){
        console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 error  :' + JSON.stringify(e));
        done();
      }
    });



    /**
     * @tc.number   ArkUX_Gauge_TrackShadow_InterfaceName_static_1500
     * @tc.name     ArkUX_Gauge_TrackShadow_InterfaceName_static_1500
     * @tc.desc     ArkUX_Gauge_TrackShadow_InterfaceName_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Gauge_TrackShadow_InterfaceName_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1400 START');
      setTimeout(() => {
          let strJson = inspector.getInspectorByKey('ArkUX_Gauge_TrackShadow_InterfaceName_1500');
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1500 START  :' + JSON.stringify(strJson));

          console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1500 component JSON.parseJsonElement(strJson).$attrs.trackShadow is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow')));
          let targetVersion = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).targetVersion;
          if (targetVersion < 11) {
            console.info("ArkUX_Gauge_TrackShadow_InterfaceName_1500 API is not 11")
          } else {
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("10.000000");
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          }
          console.info('ArkUX_Gauge_TrackShadow_InterfaceName_1500 END ');

        done();
      }, 1000)
    });

  })
}