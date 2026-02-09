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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import ohosrouter from '@ohos.router';
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { SafeAreaType, DialogButtonStyle } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
// import { Error } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const waitUiReadyMs = 1000;

class MyParams {
  data1: string = '';
  data2: DataObj = {};
}

class DataObj {
  data3: Array<number> = [0];
}

export default function ApiCommponentAddJsunit() {
  describe('ApiCommponentAddJsunit', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ApiCommponentAddJsunit beforeEach start");
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("ApiCommponentAddJsunit " + JSON.stringify(pages));
        if (!("loadingprogrees_add" == pages.name)) {
          console.info("ApiCommponentAddJsunit state success " + JSON.stringify(pages.name));
          routerAlp.pushUrl({
            url: 'MainAbility/pages/Scroll/loadingprogrees_add',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            } as MyParams
          }).then(() => {
            // success
          })
            .catch((err: Error) => {
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
     * @tc.number   apiCommponentAddJsunit_static_0100
     * @tc.name     apiCommponentAddJsunit_static_0100
     * @tc.desc     apiCommponentAddJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_0100 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/loadingprogrees_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      })
        .catch((err: Error) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('loadingAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_0100'] component obj is: " +
      obj.getElement('$attrs').getString('borderRadius'));
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('4.00vp');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_0200
     * @tc.name     apiCommponentAddJsunit_static_0200
     * @tc.desc     apiCommponentAddJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_0200 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/list_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let gridTop = CommonFunc.getComponentRectOnScreen('listadd');
      let top = gridTop.top;
      let gridBottom = CommonFunc.getComponentRectOnScreen('listadd');
      let bottom = gridBottom.bottom;
      let gridRight = CommonFunc.getComponentRectOnScreen('listadd');
      let right = gridRight.right;
      let left = gridRight.left;
      let driver = Driver.create();
      const uiContext = AppStorage.get<UIContext>('uiContext');
      await driver.swipe((Math.round(left + Math.round(uiContext!.vp2px(30)))).toInt(),
        (Math.round(top + Math.round(uiContext!.vp2px(30)))).toInt(),
        (Math.round(left + Math.round(uiContext!.vp2px(20)))).toInt(),
        (Math.round(top + Math.round(uiContext!.vp2px(30)))).toInt());
      await CommonFunc.sleep(1000);
      // judge whether the top
      let onScrollStartText = await driver.findComponent(ON.id('4'));
      let textAdd = await (onScrollStartText?.getText() as Promise<string>);
      console.info("[apiCommponentAddJsunit_static_0200] onScrollStartText: " + textAdd);
      expect(textAdd).assertEqual('4');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_0300
     * @tc.name     apiCommponentAddJsunit_static_0300
     * @tc.desc     apiCommponentAddJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_0300 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/grid_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('nexpageAdd'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // wether if swipe
      let gridText = await driver.findComponent(ON.id('25'));
      let text = await (gridText?.getText() as Promise<string>);
      console.info("[apiCommponentAddJsunit_static_0300] onScrollText: " + text);
      expect(text).assertEqual('4');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_0400
     * @tc.name     apiCommponentAddJsunit_static_0400
     * @tc.desc     apiCommponentAddJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_0400 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/scroll_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let scrollBar = await driver.findComponent(ON.type('Scroll')) as Component;
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(100);
      // wether if swipe
      let gridText = await driver.findComponent(ON.id('9'));
      let text = await (gridText?.getText() as Promise<string>);
      console.info("[apiCommponentAddJsunit_static_0500] onScrollText: " + text);
      expect(text).assertEqual('9');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_0500
     * @tc.name     apiCommponentAddJsunit_static_0500
     * @tc.desc     apiCommponentAddJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_0500 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/search_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('searchAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_0500'] component obj is: " + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('Search');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_0600
     * @tc.name     apiCommponentAddJsunit_static_0600
     * @tc.desc     apiCommponentAddJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_0600 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/swipe_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      // whether react
      let strJson = inspector.getInspectorByKey('swiperValue');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_0600'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_0700
     * @tc.name     apiCommponentAddJsunit_static_0700
     * @tc.desc     apiCommponentAddJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_0700 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/textArea_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textAreaAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_0700'] component obj is: " + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('TextArea');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_0800
     * @tc.name     apiCommponentAddJsunit_static_0800
     * @tc.desc     apiCommponentAddJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_0800 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/textinput_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textInputAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_0800'] component obj is: " + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('TextInput');
      done();

    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1000
     * @tc.name     apiCommponentAddJsunit_static_1000
     * @tc.desc     apiCommponentAddJsunit_static_1000
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_1000 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/navigation_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigationAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_1000'] component obj is: " + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('Navigation');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1100
     * @tc.name     apiCommponentAddJsunit_static_1100
     * @tc.desc     apiCommponentAddJsunit_static_1100
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_1100 START');
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/messureSize',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('width11');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_1100'] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1200
     * @tc.name     apiCommponentAddJsunit_static_1200
     * @tc.desc     apiCommponentAddJsunit_static_1200
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_1200 START');
      try {
        expect(SafeAreaType.SYSTEM).assertEqual(0);
        expect(SafeAreaType.CUTOUT).assertEqual(1);
        expect(SafeAreaType.KEYBOARD).assertEqual(2);
      } catch (err) {
        console.error("apiCommponentAddJsunit_static_1200 error " + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1300
     * @tc.name     apiCommponentAddJsunit_static_1300
     * @tc.desc     apiCommponentAddJsunit_static_1300
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_1300] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/scroll_addattrs',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      await (scrollBar?.scrollToBottom() as Promise<void>);
      await CommonFunc.sleep(100);
      // wether if swipe
      let gridText = await driver.findComponent(ON.id('9'));
      let text = await (gridText?.getText() as Promise<string>);
      console.info("[apiCommponentAddJsunit_static_1300] onScrollText: " + text);
      expect(text).assertEqual('9');
      done();

    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1400
     * @tc.name     apiCommponentAddJsunit_static_1400
     * @tc.desc     apiCommponentAddJsunit_static_1400
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_1400] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/listItemAddgroup',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('listattrs');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_1400'] component obj is: " + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('List');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1500
     * @tc.name     apiCommponentAddJsunit_static_1500
     * @tc.desc     apiCommponentAddJsunit_static_1500
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_1500] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/navrouteradd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('addOne');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_1500'] component obj is: " + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('Navigation');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1600
     * @tc.name     apiCommponentAddJsunit_static_1600
     * @tc.desc     apiCommponentAddJsunit_static_1600
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_1600] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/animateAdd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('keyImageAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_1600'] component obj is: " +
      obj.getElement('$attrs').getString('width'));
      expect(obj.getElement('$attrs').getString('width')).assertEqual('200.00vp');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1700
     * @tc.name     apiCommponentAddJsunit_static_1700
     * @tc.desc     apiCommponentAddJsunit_static_1700
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_1700] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/bindConver',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('buttonAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_1700'] component obj is: " +
      obj.getElement('$attrs').getString('borderWidth'));
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual('0.00vp');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1800
     * @tc.name     apiCommponentAddJsunit_static_1800
     * @tc.desc     apiCommponentAddJsunit_static_1800
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_1800] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/common_ets_api',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('labelAAd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_1800'] component obj is: " +
      obj.getElement('$attrs').getString('width'));
      expect(obj.getElement('$attrs').getString('width')).assertEqual('320.00vp');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_1900
     * @tc.name     apiCommponentAddJsunit_static_1900
     * @tc.desc     apiCommponentAddJsunit_static_1900
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_1900] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/commonAdd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(4000);
      let strJson = inspector.getInspectorByKey('commonAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_1900'] component obj is: " +
      obj.getElement('$attrs').getString('width'));
      expect(obj.getElement('$attrs').getString('width')).assertEqual('300.00vp');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_2000
     * @tc.name     apiCommponentAddJsunit_static_2000
     * @tc.desc     apiCommponentAddJsunit_static_2000
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_2000] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/createBuilderadd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('crateFrom');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_2000'] component obj is: " +
      obj.getElement('$attrs').getString('borderWidth'));
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual('0.00vp');
      done();
    });

    
    /**
     * @tc.number   apiCommponentAddJsunit_static_2100
     * @tc.name     apiCommponentAddJsunit_static_2100
     * @tc.desc     apiCommponentAddJsunit_static_2100
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_2100] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/dragAdd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('dragAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_2100'] component obj is: " +
      obj.getElement('$attrs').getString('margin'));
      expect(obj.getElement('$attrs').getString('margin')).assertEqual('10.00vp');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_2200
     * @tc.name     apiCommponentAddJsunit_static_2200
     * @tc.desc     apiCommponentAddJsunit_static_2200
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_2200] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/TouchAdd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('touchAdd');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_2200'] component obj is: " +
      obj.getElement('$attrs').getString('margin'));
      expect(obj.getElement('$attrs').getString('margin')).assertEqual('0.00vp');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_2300
     * @tc.name     apiCommponentAddJsunit_static_2300
     * @tc.desc     apiCommponentAddJsunit_static_2300
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_2300] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/navition3',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ArkUX_Navigation_1111');
      console.info('apiCommponentAddJsunit_static_2300 START  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("apiCommponentAddJsunit_static_2300 obj is: " + JSON.stringify(obj));
      let mode: string = obj.getElement('$attrs').getString('mode')
      let minContentWidth: string = obj.getElement('$attrs').getString('minContentWidth')
      let navBarWidth: string = obj.getElement('$attrs').getString('navBarWidth')
      let navBarWidthRange: string = obj.getElement('$attrs').getString('navBarWidthRange')
      expect(mode).assertEqual("NavigationMode.AUTO");
      expect(minContentWidth).assertEqual("50.00vp");
      expect(navBarWidth).assertEqual("100.00vp");
      expect(navBarWidthRange).assertEqual("50.00vp, 300.00vp");
      console.info('apiCommponentAddJsunit_static_2300 END ');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_2400
     * @tc.name     apiCommponentAddJsunit_static_2400
     * @tc.desc     apiCommponentAddJsunit_static_2400
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_2400] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/richEditor',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('richEditor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_2400'] component obj is: " + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('RichEditor');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_2500
     * @tc.name     apiCommponentAddJsunit_static_2500
     * @tc.desc     apiCommponentAddJsunit_static_2500
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_2500] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/richEditorCustomKeyBoard',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('richEditor1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_2500'] component obj is: " + obj.getString('$type'));
      expect(obj.getString('$type')).assertEqual('RichEditor');
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_2600
     * @tc.name     apiCommponentAddJsunit_static_2600
     * @tc.desc     apiCommponentAddJsunit_static_2600
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('apiCommponentAddJsunit_static_2600 START');
      try {
        expect(DialogButtonStyle.HIGHLIGHT).assertEqual(1);
      } catch (err) {
        console.error("apiCommponentAddJsunit_static_2600 error " + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   apiCommponentAddJsunit_static_2700
     * @tc.name     apiCommponentAddJsunit_static_2700
     * @tc.desc     apiCommponentAddJsunit_static_2700
     * @tc.level    Level.LEVEL0
     */
it('apiCommponentAddJsunit_static_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[apiCommponentAddJsunit_static_2700] START");
      const routerAlp = AppStorage.get<Router>("router") as Router
      routerAlp.clear();
      routerAlp.pushUrl({
        url: 'MainAbility/pages/Scroll/lifecycle',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        // success
      }).catch((err: Error) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('S1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[apiCommponentAddJsunit_static_2700] component obj is: " +
      obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('S1');
      done();
    });
  })
}