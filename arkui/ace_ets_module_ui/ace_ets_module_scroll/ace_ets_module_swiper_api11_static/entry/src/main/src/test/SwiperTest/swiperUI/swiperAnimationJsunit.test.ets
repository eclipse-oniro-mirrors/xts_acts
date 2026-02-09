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
import { Message, GlobalMessage } from '../../../../ets/MainAbility/common/MessageManager1';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;

export interface RouterParams {
  data1: string,
  data2: Data2
}

export interface Data2 {
  data3: number[]
}

export default function swiperAnimationJsunit() {
  describe('swiperAnimationJsunit', () => {
    beforeAll(() => {
      console.info("swiperAnimationJsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("swiperAnimationJsunit beforeEach start");
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/index/second',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0024
     * @tc.name     swiperAnimationJsunit_static_0024
     * @tc.desc     swiperAnimationJsunit_static_0024
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0024', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0024');
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      await CommonFunc.sleep(1000);
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0024 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = top - bottom;
      let width = right - left;
      // to swiper
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(1000);
      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationEnd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0024'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('End2-->');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0012
     * @tc.name     swiperAnimationJsunit_static_0012
     * @tc.desc     swiperAnimationJsunit_static_0012
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0012 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0012 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      // to swiper
      let driver2 = Driver.create();
      await CommonFunc.sleep(500);
      await driver2.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      await driver2.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationStart');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0012'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Start2-->3');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0027
     * @tc.name     swiperAnimationJsunit_static_0027
     * @tc.desc     swiperAnimationJsunit_static_0027
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0027', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0027 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;

      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0027 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      //to autoplay
      const globalMessage =
        AppStorage.get<GlobalMessage<boolean>>('SwiperAnimationExample');
      globalMessage?.message.notify({
        name: 'autoPlay', value: true
      })
      await CommonFunc.sleep(5000);

      //  to press screen
      let driver3 = Driver.create();
      await CommonFunc.sleep(200);
      await driver3.longClick(Math.round(right / 2) as Int, Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationEnd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0027'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('End2-->');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0019
     * @tc.name     swiperAnimationJsunit_static_0019
     * @tc.desc     swiperAnimationJsunit_static_0019
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0019 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0019 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      //to autoplay
      const globalMessage =
        AppStorage.get<GlobalMessage<boolean>>('SwiperAnimationExample');
      globalMessage?.message.notify({
        name: 'autoPlay', value: true
      })
      await CommonFunc.sleep(500);

      //  to press screen
      let driver = Driver.create();
      await CommonFunc.sleep(200);
      await driver.longClick(Math.round(right / 2) as Int, Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      // to swipe for duration
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);

      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationStart');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0019'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Start2-->3');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0022
     * @tc.name     swiperAnimationJsunit_static_0022
     * @tc.desc     swiperAnimationJsunit_static_0022
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0019 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0022 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      //to autoplay
      const globalMessage =
        AppStorage.get<GlobalMessage<boolean>>('SwiperAnimationExample');
      globalMessage?.message.notify({
        name: 'autoPlay', value: true
      })
      await CommonFunc.sleep(5000);
      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationStart');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0022'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Start1-->2');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0023
     * @tc.name     swiperAnimationJsunit_static_0023
     * @tc.desc     swiperAnimationJsunit_static_0023
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0023 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0023 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      // click the previous Button
      let driver = Driver.create();
      await CommonFunc.sleep(200);
      let showNext = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext.click();
      await CommonFunc.sleep(1000);

      let showPrevious = await driver.findComponent(ON.id('showPrevious')) as Component;
      await showPrevious.click();
      await CommonFunc.sleep(1000);


      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationEnd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0023'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('End1-->');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0011
     * @tc.name     swiperAnimationJsunit_static_0011
     * @tc.desc     swiperAnimationJsunit_static_0011
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0011 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0011 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      // click the previous Button
      let driver = Driver.create();
      await CommonFunc.sleep(200);
      let showNext = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext.click();
      await CommonFunc.sleep(1000);

      let showPrevious = await driver.findComponent(ON.id('showPrevious')) as Component;
      await showPrevious.click();
      await CommonFunc.sleep(1000);

      let showNext2 = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext2.click();
      await CommonFunc.sleep(1000);

      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationStart');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0011'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Start1-->2');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0028
     * @tc.name     swiperAnimationJsunit_static_0028
     * @tc.desc     swiperAnimationJsunit_static_0028
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0028', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0011 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0028 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      // click the previous Button
      let driver = Driver.create();
      await CommonFunc.sleep(200);
      let showNext = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext.click();
      await CommonFunc.sleep(1000);

      let showPrevious = await driver.findComponent(ON.id('showPrevious')) as Component;
      await showPrevious.click();
      await CommonFunc.sleep(1000);

      let showNext2 = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext2.click();
      await CommonFunc.sleep(1000);

      // press screen to swipe
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);


      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationEnd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0028'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('End3-->');

      done();
    });


    
    /**
     * @tc.number   swiperAnimationJsunit_static_0020
     * @tc.name     swiperAnimationJsunit_static_0020
     * @tc.desc     swiperAnimationJsunit_static_0020
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationJsunit_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationJsunit_static_0011 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);

        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0020 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      // click the previous Button
      let driver = Driver.create();
      await CommonFunc.sleep(200);
      let showNext = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext.click();
      await CommonFunc.sleep(1000);

      let showPrevious = await driver.findComponent(ON.id('showPrevious')) as Component;
      await showPrevious.click();
      await CommonFunc.sleep(1000);

      let showNext2 = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext2.click();
      await CommonFunc.sleep(1000);

      // press screen to swipe
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(3000);
      await driver.swipe(Math.round(left + width * 0.4) as Int, Math.round(bottom + height / 2) as Int,
        Math.round(left + width * 0.4) as Int, Math.round(bottom + height / 2) as Int);

      await CommonFunc.sleep(500);

      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('animationStart');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0020'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Start2-->3');

      done();
    });


    
    /**
     * @tc.number   swiperAnimationGestureJsunit_static_0016
     * @tc.name     swiperAnimationGestureJsunit_static_0016
     * @tc.desc     swiperAnimationGestureJsunit_static_0016
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationGestureJsunit_static_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationGestureJsunit_static_0016 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationGestureJsunit_static_0016 value is" + left + " --" + right + "--" + top + "--" +
        bottom);

      let height = top - bottom;
      let width = right - left;

      // to swiper
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      // getComponentRectOnScreen
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);

      await CommonFunc.sleep(1000);
      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('GestureSwipe');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationGestureJsunit_static_0016] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('GestureSwipe index: 1');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationGestureJsunit_static_0017
     * @tc.name     swiperAnimationGestureJsunit_static_0017
     * @tc.desc     swiperAnimationGestureJsunit_static_0017
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationGestureJsunit_static_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationGestureJsunit_static_0017 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0017 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      // to swiper
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('GestureSwipe');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0017'] component obj2 is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('GestureSwipe index: 1');
      await driver.swipe(Math.round(left + width * 0.4) as Int, Math.round(bottom + height / 2) as Int,
        Math.round(left + width * 0.4) as Int, Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('GestureSwipe');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[swiperAnimationJsunit_static_0012'] component obj3 is: " +
      obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('GestureSwipe index: 1');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationGestureJsunit_static_0019
     * @tc.name     swiperAnimationGestureJsunit_static_0019
     * @tc.desc     swiperAnimationGestureJsunit_static_0019
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationGestureJsunit_static_0019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationGestureJsunit_static_0019 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0019 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      //to autoplay
      const globalMessage =
        AppStorage.get<GlobalMessage<boolean>>('SwiperAnimationExample');
      globalMessage?.message.notify({
        name: 'autoPlay', value: true
      })
      await CommonFunc.sleep(500);
      // to swiper
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      // check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('GestureSwipe');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0019'] component obj2 is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('GestureSwipe index: 1');
      await driver.swipe(Math.round(left + width * 0.4) as Int, Math.round(bottom + height / 2) as Int,
        Math.round(left + width * 0.4) as Int, Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('GestureSwipe');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[swiperAnimationJsunit_static_0019'] component obj3 is: " +
      obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('GestureSwipe index: 1');
      done();
    });


    
    /**
     * @tc.number   swiperAnimationGestureJsunit_static_0020
     * @tc.name     swiperAnimationGestureJsunit_static_0020
     * @tc.desc     swiperAnimationGestureJsunit_static_0020
     * @tc.level    Level.LEVEL0
     */
it('swiperAnimationGestureJsunit_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperAnimationGestureJsunit_static_0020 START');
      await CommonFunc.sleep(1000);
      try {
        const ohosrouter = AppStorage.get<Router>("router") as Router;
        ohosrouter.back({
          url: 'MainAbility/pages/index/second'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState() as router.RouterState;
        console.info("swiperAnimationJsunit " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/Swiper/swiperUI/swiperAnimation',
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
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      // get the rect of swiper
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('swiperAnimation');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("swiperAnimationJsunit_static_0020 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let height = top - bottom;
      let width = right - left;
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let showNext = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext.click();
      await CommonFunc.sleep(1000);

      let showPrevious = await driver.findComponent(ON.id('showPrevious')) as Component;
      await showPrevious.click();
      await CommonFunc.sleep(1000);

      let showNext2 = await driver.findComponent(ON.id('showNext')) as Component;
      await showNext2.click();
      await CommonFunc.sleep(1000);

      // to swiper
      await driver.swipe(Math.round(right - width * 0.4) as Int, Math.round(bottom + height / 2) as Int, 0,
        Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(3000);
      //check the onAnimation triggers
      let strJson = inspector.getInspectorByKey('GestureSwipe');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperAnimationJsunit_static_0020'] component obj2 is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('GestureSwipe index: 2');
      await driver.swipe(Math.round(left + width * 0.4) as Int, Math.round(bottom + height / 2) as Int,
        Math.round(left + width * 0.4) as Int, Math.round(bottom + height / 2) as Int);
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('GestureSwipe');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[swiperAnimationJsunit_static_0020'] component obj3 is: " +
      obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('GestureSwipe index: 2');
      done();
    });
  })
}