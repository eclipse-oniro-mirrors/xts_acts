'use static';
/**
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Message, GlobalMessage, MessageManager } from '../../../../ets/MainAbility/common/MessageManager1';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { RouterParams, Data2 } from './swiperAnimationJsunit.test';
import window from '@ohos.window';
import { $r, Resource, Length } from '@ohos.arkui.component';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;
const uiContext = new UIContext();

export default function SwiperNextPrevMarginAddJsunit() {
  describe('SwiperNextPrevMarginAddJsunit', () => {
    beforeAll(() => {
      console.info("SwiperNextPrevMarginAddJsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SwiperNextPrevMarginAddJsunit beforeEach start");
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.clear();
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("ApiCommponentAddJsunit " + JSON.stringify(pages));
        if (!("swiperNextPrevMargin" == pages.name)) {
          console.info("ApiCommponentAddJsunit state success " + JSON.stringify(pages.name));
          ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              } as Data2
            } as RouterParams
          }).then(() => {
            // success
          })
            .catch((err: Error): void => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push circle page success ");
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0100
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0100
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_0100'] component obj is: " +
      obj.getElement('$attrs').getString('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('0.00vp');
      done();
    });



    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0400
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0400
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample');
      globalMessage?.notify({
        name: 'nextMargin', value: 30
      })
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_0400'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('30.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right1 = columnSwiper.right;
      let left1 = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight1 = swiperMargin.right;
      let swiperLeft1 = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0400'] component value is: " + right1 + "," + left1 + ","
        + swiperRight1 + "," + swiperLeft1);
      expect(Math.abs(Math.round((right1 - left1) - (swiperRight1 - swiperLeft1))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_022
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_022
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_022
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_022 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample');
      globalMessage?.notify({
        name: 'nextMargin', value: 0
      })
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SwiperNextPrevMarginAddJsunit_static_022'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right1 = columnSwiper.right;
      let left1 = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight1 = swiperMargin.right;
      let swiperLeft1 = swiperMargin.left;
      console.info("[SwiperNextPrevMarginAddJsunit_static_022'] component value is: " + right1 + "," + left1 + ","
        + swiperRight1 + "," + swiperLeft1);
      expect(Math.abs(Math.round(((right1 - left1) * 0.9) - (swiperRight1 - swiperLeft1))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0600
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0600
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample');
      globalMessage?.notify({
        name: 'nextMargin', value: $r("app.string.nextMargin")
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_0600'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0600'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });


    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0700
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0700
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0700 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample');
      globalMessage?.notify({
        name: 'nextMargin', value: 0
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_0700'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('0.00vp');
      done();
    });



    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0900
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0900
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0900 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample');
      globalMessage?.notify({
        name: 'prevMargin', value: 30
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_0900'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('30.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0400'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_1100
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_1100
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_1100
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_1100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample');
      globalMessage?.notify({
        name: 'nextMargin', value: $r("app.string.prevMargin")
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: $r("app.string.nextMargin")
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_1100'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('20.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1100'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_1200
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_1200
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_1200
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_1100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample');
      globalMessage?.notify({
        name: 'nextMargin', value: 30
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: 40
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_1200'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('30.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('40.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1100'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });


    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_1400
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_1400
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_1400
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_1400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | undefined | null>>('SwiperNextPrevMarginExample');
      globalMessage?.notify({
        name: 'nextMargin', value: 1000
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: 1000
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_1400'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('0.00px');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('0.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1400'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_1500
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_1500
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_1500
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_1500 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginDuplicate',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginDuplicate');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_1500'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('4.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('4.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperDuplicate');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('ColumnSwiperDuplicate');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1500'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_1600
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_1600
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_1600
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_1600 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_1600'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('30.00%');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('30.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1600'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left) * 0.9) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_1700
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_1700
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_1700
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_1700 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<MessageManager<string | Resource>>('SwiperNextPrevMarginExampleString');
      globalMessage?.notify({
        name: 'nextMargin', value: '10000%'
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: '10000%'
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_1700'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('10000.00%');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('10000.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1700'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left) * 0.9) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_1800
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_1800
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_1800
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_1800 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<string | Resource>>('SwiperNextPrevMarginExampleString');
      globalMessage?.notify({
        name: 'nextMargin', value: '20%'
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: '20%'
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_1800'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('20.00%');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('20.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1800'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left) * 0.9) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_1900
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_1900
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_1900
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_1900 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<string | Resource>>('SwiperNextPrevMarginExampleString');
      globalMessage?.notify({
        name: 'nextMargin', value: 'abc'
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: 'abc'
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_1900'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1900'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left) * 0.9) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_2000
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_2000
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_2000
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_2000 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<string | Resource>>('SwiperNextPrevMarginExampleString');
      globalMessage?.notify({
        name: 'nextMargin', value: '30px'
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: '30px'
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_2000'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('30.00px');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('30.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2000'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_2100
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_2100
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_2100
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_2100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<string | Resource>>('SwiperNextPrevMarginExampleString');
      globalMessage?.notify({
        name: 'nextMargin', value: '30fp'
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: '30fp'
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_2100'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('30.00fp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('30.00fp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2100'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_2200
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_2200
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_2200
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_2200 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<string | Resource>>('SwiperNextPrevMarginExampleString');
      globalMessage?.notify({
        name: 'nextMargin', value: '30lpx'
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: '30lpx'
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_2200'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('30.00lpx');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('30.00lpx');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2200'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_2300
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_2300
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_2300
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_2300 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<string | Resource>>('SwiperNextPrevMarginExampleString');
      globalMessage?.notify({
        name: 'nextMargin', value: $r("app.string.nextMarginString")
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: $r("app.string.prevMarginString")
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_2300'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('20.00px');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('20.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2300'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_020
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_020
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_020
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_2400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginNoMargin',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginNo');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_2200'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperNo');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginNo');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2400'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left) * 0.9) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_2500
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_2500
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_2500
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_2500 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<string | Resource>>('SwiperNextPrevMarginExampleString');
      globalMessage?.notify({
        name: 'nextMargin', value: $r("app.float.nextMargin")
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'prevMargin', value: $r("app.float.prevMargin")
      });
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('swiperNextPrevMarginString');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_2300'] component obj is: " +
      obj.getElement('$attrs').getElement('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('30.00vp');
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('30.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2300'] component value is: " + right + "," + left + ","
        + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left) - (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0076
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0076
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0076
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0076', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0076 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin76',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // calculate
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin76');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin76');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0076] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getElement('padding')));
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('10.00vp');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");
      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;
      const uiContex = new UIContext();
      expect(Math.floor(Math.abs((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(4 + 2 + 2 * 10)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0078
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0078
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0078
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0078', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0078 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin78',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // calculate
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin78');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin78');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0078] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual("4.00vp");
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual("2.00vp");

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;
      const uiContext = new UIContext()
      expect(Math.abs(Math.floor((right - left + UIContext.resolveUIContext()!.vp2px(4 + 2 + 2 * 10)) - (swiperRight - swiperLeft))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0077
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0077
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0077
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0077', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0077 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin78',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymnaic change the value
      const globalMessage = AppStorage.get<MessageManager<int>>('SwiperNextPrevMarginExample78');
      globalMessage?.notify({
        name: 'displayCount', value: 2
      });
      await CommonFunc.sleep(500);
      // calculate
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin78');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin78');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0077] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('10.00vp');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      expect(Math.floor(Math.abs((2 * (right - left) + UIContext.resolveUIContext()!.vp2px(4 + 2 + 2 * 10)) -
        (swiperRight - swiperLeft))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0081
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0081
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0081
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0081', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0081 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin81',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin81');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0081] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('10.00vp');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin81');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      expect(Math.abs(Math.floor((right - left + UIContext.resolveUIContext()!.vp2px(4 + 2 + 2 * 10)) - (swiperRight - swiperLeft))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0080
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0080
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0080
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0080 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin81',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymnaic change the value
      const globalMessage = AppStorage.get<MessageManager<int>>('SwiperNextPrevMarginExample81');
      globalMessage?.notify({
        name: 'displayCount', value: 2
      });
      await CommonFunc.sleep(500);
      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin81');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0081] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('10.00vp');

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin81');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      expect(Math.abs(Math.floor((2 * (right - left) + UIContext.resolveUIContext()!.vp2px(4 + 2 + 2 * 10)) -
        (swiperRight - swiperLeft))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0079
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0079
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0079
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0079', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0079 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin79',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin79');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0079] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      expect(obj.getElement('$attrs').getString('padding')).assertEqual('10.00vp');

      // calculate the gap
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin79');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      expect(Math.abs(Math.floor((right - left) - (swiperRight - swiperLeft - UIContext.resolveUIContext()!.vp2px(2 * 10 + 2 + 4)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0082
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0082
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0082
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0082', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0082 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin82',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin82');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate
      let strJson = inspector.getInspectorByKey('1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0082] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');


      expect(padding).assertEqual('10.00vp');
      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(20 + 40)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0083
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0083
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0083
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0083', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0083 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin83',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin83');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin83');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0083] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('3.00vp');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("30.00vp");
      expect(prevMargin).assertEqual("30.00vp");

      expect(Math.floor(Math.abs((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(2 * 3 + 2 * 30)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0084
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0084
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0084
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0084', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0084 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin84',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin84');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate
      let strJson = inspector.getInspectorByKey('1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0084] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0085
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0085
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0085
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0085', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0085 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin85',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin85');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate
      let strJson = inspector.getInspectorByKey('1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0085] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0063
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0063
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0063
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0063', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0063 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin63',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin63');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin63');
      let obj = JSON.parseJsonElement(strJson);
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(15 + 6)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0062
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0062
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0062
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0062', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0062 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin62',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin62');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin62');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0062] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));


      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom - UIContext.resolveUIContext()!.vp2px(15 + 6)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0061
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0061
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0061
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0061', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0061 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin61',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin61');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin61');
      let obj = JSON.parseJsonElement(strJson);

      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(Math.floor(Math.abs((swiperRight - swiperLeft) - (3 * (right - left) + UIContext.resolveUIContext()!.vp2px(15 + 6)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0060
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0060
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0060
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0060 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin60',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin60');
      let obj = JSON.parseJsonElement(strJson);

      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin60');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;
      let subcomponment2 = CommonFunc.getComponentRect('2');
      let top2 = subcomponment2.top;
      let bottom2 = subcomponment2.bottom;
      let subcomponment3 = CommonFunc.getComponentRect('3');
      let top3 = subcomponment3.top;
      let bottom3 = subcomponment3.bottom;
      console.info(`[SwiperNextPrevMarginAddJsunit_static_0060] swiperTop - swiperbottom=
      ${(swiperTop - swiperbottom)}`);
      console.info(`[SwiperNextPrevMarginAddJsunit_static_0060] ((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - UIContext.resolveUIContext()!.vp2px(15 + 6))=
      ${((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - UIContext.resolveUIContext()!.vp2px(15 + 6))}`);
      expect(Math.abs(Math.floor((swiperTop - swiperbottom) -
        ((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - UIContext.resolveUIContext()!.vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0067
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0067
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0067
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0067', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0067 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin67',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin67');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin67');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0067] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(15 + 6 + 2 * 10)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0066
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0066
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0066
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0066', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0066 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin66',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin66');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin66');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0066] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom - UIContext.resolveUIContext()!.vp2px(2 * 10 + 15 + 6)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0065
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0065
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0065
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0065', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0065 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin65',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin65');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin65');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0065] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft) -
        (3 * (right - left) + UIContext.resolveUIContext()!.vp2px(15 + 6 + 4 * 10)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0064
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0064
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0064
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0064', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0064 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin64',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin64');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin64');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0064] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round(swiperTop - swiperbottom) -
      Math.round(3 * (top - bottom) - UIContext.resolveUIContext()!.vp2px(4 * 10 + 15 + 6))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0055
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0055
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0055
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0055', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0055 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin55',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin55');
      let swiperLeft = swiperMargin.left;
      let swiperRight = swiperMargin.right;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let left = subcomponment.left;
      let right = subcomponment.right;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin55');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0055] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("0.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(15 + 6)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0054
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0054
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0054
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0054', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0054 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin54',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin54');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin54');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0054] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom - UIContext.resolveUIContext()!.vp2px(15 + 6)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0053
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0053
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0053
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0053', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0053 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin53',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin53');
      let swiperLeft = swiperMargin.left;
      let swiperRight = swiperMargin.right;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let left = subcomponment.left;
      let right = subcomponment.right;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin53');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0053] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");

      expect(Math.floor(Math.abs((swiperRight - swiperLeft) - (3 * (right - left) + UIContext.resolveUIContext()!.vp2px(15 + 6)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0052
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0052
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0052
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0052', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0052 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin52',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin52');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;
      let subcomponment2 = CommonFunc.getComponentRect('2');
      let top2 = subcomponment2.top;
      let bottom2 = subcomponment2.bottom;
      let subcomponment3 = CommonFunc.getComponentRect('3');
      let top3 = subcomponment3.top;
      let bottom3 = subcomponment3.bottom;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin52');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0052] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");

      console.info(`[SwiperNextPrevMarginAddJsunit_static_0052] swiperTop - swiperbottom=
      ${(swiperTop - swiperbottom)}`);
      console.info(`[SwiperNextPrevMarginAddJsunit_static_0052] ((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - UIContext.resolveUIContext()!.vp2px(15 + 6))=
      ${((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - UIContext.resolveUIContext()!.vp2px(15 + 6))}`);
      expect(Math.abs(Math.floor((swiperTop - swiperbottom) -
        ((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - UIContext.resolveUIContext()!.vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0059
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0059
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0059
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0059', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0059 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin59',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin59');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin59');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0059] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(15 + 6 + 2 * 10)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0058
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0058
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0058
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0058', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0058 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin58',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin58');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin58');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0058] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom - UIContext.resolveUIContext()!.vp2px(15 + 6 + 2 * 10)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0057
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0057
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0057
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0057', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0057 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin57',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin57');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin57');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0057] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft) -
        (3 * (right - left) + UIContext.resolveUIContext()!.vp2px(15 + 6 + 4 * 10)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0056
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0056
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0056
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0056', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0056 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin56',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin56');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      // calculate
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin56');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0056] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let padding: string = obj.getElement('$attrs').getString('padding');
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      let prevMargin: string = obj.getElement('$attrs').getString('prevMargin');
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round(swiperTop - swiperbottom) -
      Math.round(3 * (top - bottom) - UIContext.resolveUIContext()!.vp2px(15 + 6 + 4 * 10))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0050
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0050
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0050
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0050 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 450
      });
      await CommonFunc.sleep(500);
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0050] component obj is: " +
      obj.getElement('$attrs').getElement('padding'));

      let borderWidth: string = obj.getElement('$attrs').getString('borderWidth');
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0051
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0051
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0051
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0051', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0051 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 450
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let borderWidth: string = obj.getElement('$attrs').getString('borderWidth');
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0042
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0042
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0042
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0042', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0042 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: -3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: false
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: -3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let borderWidth: string = obj.getElement('$attrs').getString('borderWidth');
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0043
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0043
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0043
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0043', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0043 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: -3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: -3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let borderWidth: string = obj.getElement('$attrs').getString('borderWidth');
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0044
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0044
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0044
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0044', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0044 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: -3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: false
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: -3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 10
      });
      await CommonFunc.sleep(500);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;
      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');

      let obj = JSON.parseJsonElement(strJson);
      let borderWidth: string = obj.getElement('$attrs').getString('borderWidth');
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0045
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0045
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0045
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0045', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0045 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: -3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: -3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 10
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let borderWidth: string = obj.getElement('$attrs').getString('borderWidth');
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0046
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0046
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0046
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0046', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0046 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: false
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let subcomponment2 = CommonFunc.getComponentRect('2');
      let right2 = subcomponment2.right;
      let left2 = subcomponment2.left;

      let subcomponment3 = CommonFunc.getComponentRect('3');
      let right3 = subcomponment3.right;
      let left3 = subcomponment3.left;


      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let borderWidth: string = obj.getElement('$attrs').getString('borderWidth');
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.floor((swiperRight - swiperLeft) -
        ((right - left) + (right2 - left2) + (right3 - left3)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0047
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0047
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0047
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0047', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0047 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let borderWidth: string = obj.getElement('$attrs').getString('borderWidth');
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (3 * (top - bottom)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0048
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0048
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0048
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0048', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0048 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: false
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 10
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');
      expect(itemspace).assertEqual('10.00vp');

      expect(Math.abs(Math.floor((swiperRight - swiperLeft) - (3 * (right - left) + UIContext.resolveUIContext()!.vp2px(2 * 10)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0049
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0049
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0049
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0049', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0049 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let itemspace: string = obj.getElement('$attrs').getString('itemSpace');
      expect(itemspace).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (3 * (top - bottom)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0072
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0072
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0072
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0072', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0072 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: false
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 1
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: false
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(5)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0073
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0073
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0073
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0073', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0073 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 1
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: false
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      expect(nextMargin).assertEqual('5.00vp');
      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom - UIContext.resolveUIContext()!.vp2px(5)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0074
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0074
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0074
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0074', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0074 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: false
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 1
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: true
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      expect(nextMargin).assertEqual('5.00vp');
      expect(Math.abs(Math.round((swiperRight - swiperLeft) - (right - left + UIContext.resolveUIContext()!.vp2px(5)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0075
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0075
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0075
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0075', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0075 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 1
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: true
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom) - (top - bottom - UIContext.resolveUIContext()!.vp2px(5)))) <= 1).assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0068
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0068
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0068
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0068', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0068 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: false
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: false
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.floor(Math.abs((swiperRight - swiperLeft) - (3 * (right - left) + UIContext.resolveUIContext()!.vp2px(5)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0069
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0069
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0069
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0069', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0069 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: false
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.abs(Math.round(swiperTop - swiperbottom) - Math.round(3 * (top - bottom) - UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0070
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0070
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0070
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0070 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: false
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: true
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right = subcomponment.right;
      let left = subcomponment.left;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      let nextMargin: string = obj.getElement('$attrs').getString('nextMargin');
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.floor(Math.abs((swiperRight - swiperLeft) - (3 * (right - left) + UIContext.resolveUIContext()!.vp2px(5)))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0071
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0071
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0071
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0071', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0071 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: true
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('5.00vp');

      expect(Math.abs(Math.round(swiperTop - swiperbottom) - Math.round(3 * (top - bottom) - UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0041
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0041
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0041
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0041', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0041 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      //dymanic chage the value
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: true
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('5.00vp');
      expect(Math.abs(Math.round(swiperTop - swiperbottom) - Math.round(3 * (top - bottom) - UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();

      // CommonFunc.setScreenOrientation(window.Orientation.PORTRAIT);
      await CommonFunc.sleep(3000);
      expect(Math.abs(Math.round(swiperTop - swiperbottom) - Math.round(3 * (top - bottom) - UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();
      await CommonFunc.sleep(3000);
      done();
    });


    
    /**
     * @tc.number   SwiperNextPrevMarginAddJsunit_static_0040
     * @tc.name     SwiperNextPrevMarginAddJsunit_static_0040
     * @tc.desc     SwiperNextPrevMarginAddJsunit_static_0040
     * @tc.level    Level.LEVEL0
     */
it('SwiperNextPrevMarginAddJsunit_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwiperNextPrevMarginAddJsunit_static_0040 START');
      await CommonFunc.sleep(1000);
      const ohosrouter = AppStorage.get<Router>("router") as Router;
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as Data2
        } as RouterParams
      }).then(() => {
        // success
      })
        .catch((err: Error): void => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      const globalMessage = AppStorage.get<MessageManager<Length | boolean>>('SwiperNextPrevMarginExample50');
      //dymanic chage the value
      globalMessage?.notify({
        name: 'prevMargin', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'vertical', value: true
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'nextMargin', value: 5
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'itemSpace', value: 0
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'displayCount', value: 3
      });
      await CommonFunc.sleep(500);
      globalMessage?.notify({
        name: 'loop', value: true
      });
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top = subcomponment.top;
      let bottom = subcomponment.bottom;

      let strJson = inspector.getInspectorByKey('swiperNextPrevMargin50');
      let obj = JSON.parseJsonElement(strJson);
      const uiContext = new UIContext();
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('5.00vp');
      expect(Math.abs(Math.round(swiperTop - swiperbottom) - Math.round(3 * (top - bottom) - UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();

      // CommonFunc.setScreenOrientation(window.Orientation.LANDSCAPE);
      await CommonFunc.sleep(3000);
      expect(Math.abs(Math.round(swiperTop - swiperbottom) - Math.round(3 * (top - bottom) - UIContext.resolveUIContext()!.vp2px(5))) <= 1)
        .assertTrue();
      await CommonFunc.sleep(3000);
      done();
    });
  })
}