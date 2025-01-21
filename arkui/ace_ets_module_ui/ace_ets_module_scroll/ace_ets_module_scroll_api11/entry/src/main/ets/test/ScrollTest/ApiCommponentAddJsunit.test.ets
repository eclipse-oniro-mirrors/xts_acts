/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ohosrouter from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import { BusinessError } from '@ohos.base';
const waitUiReadyMs = 1000;

export default function ApiCommponentAddJsunit() {
  describe('ApiCommponentAddJsunit', () => {
    beforeAll(async (done: Function) => {
      console.info("ApiCommponentAddJsunit beforeEach start");
      try {
        ohosrouter.clear();
        let pages = ohosrouter.getState();
        console.info("ApiCommponentAddJsunit " + JSON.stringify(pages));
        if (!("loadingprogrees_add" == pages.name)) {
          console.info("ApiCommponentAddJsunit state success " + JSON.stringify(pages.name));
          ohosrouter.pushUrl({
            url: 'MainAbility/pages/Scroll/loadingprogrees_add',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
              // success
            })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push circle page success ");
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      done()

    });

    it('apiCommponentAddJsunit_0100', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0100 START');
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/loadingprogrees_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('loadingAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0100'] component obj is: " + obj.$attrs.borderRadius);
      expect(obj.$attrs.borderRadius).assertEqual('4.00vp');
      done();
    });

    it('apiCommponentAddJsunit_0200', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0200 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/list_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      let gridTop = CommonFunc.getComponentRect('listadd');
      let top = gridTop.top;
      let gridBottom = CommonFunc.getComponentRect('listadd');
      let bottom = gridBottom.bottom;
      let gridRight = CommonFunc.getComponentRect('listadd');
      let right = gridRight.right;
      let driver = await Driver.create();
      await driver.swipe(Math.round(top + 50), Math.round(right - 50), Math.round(bottom - 50), Math.round(right - 50));
      await CommonFunc.sleep(1000);
      // judge whether the top
      let onScrollStartText = await driver.findComponent(ON.id('4'));
      let textAdd = await onScrollStartText.getText();
      console.info("[apiCommponentAddJsunit_0200] onScrollStartText: " + textAdd);
      expect(textAdd).assertEqual('4');
      done();
    });

    it('apiCommponentAddJsunit_0300', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0300 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/grid_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('nexpageAdd'));
      await btn.click();
      await CommonFunc.sleep(100);
      // wether if swipe
      let gridText = await driver.findComponent(ON.id('25'));
      let  text = await gridText.getText();
      console.info("apiCommponentAddJsunit_0300] onScrollText: " + text);
      expect(text).assertEqual('4');
      done();
    });

    it('apiCommponentAddJsunit_0400', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0400 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/scroll_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(100);
      // wether if swipe
      let gridText = await driver.findComponent(ON.id('9'));
      let  text = await gridText.getText();
      console.info("[apiCommponentAddJsunit_0500] onScrollText: " + text);
      expect(text).assertEqual('9');
      done();
    });

    it('apiCommponentAddJsunit_0500', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0500 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/search_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('searchAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0500'] component obj is: " + obj.$type);
      expect(obj.$type).assertEqual('Search');
      done();
    });

    it('apiCommponentAddJsunit_0600', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0600 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swipe_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      // whether react
      let strJson = getInspectorByKey('swiperValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0600'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('hello');
      done();
    });

    it('apiCommponentAddJsunit_0700', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0700 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/textArea_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textAreaAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0700'] component obj is: " + obj.$type);
      expect(obj.$type).assertEqual('TextArea');
      done();
    });

    it('apiCommponentAddJsunit_0800', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0800 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/textinput_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      let strJson = getInspectorByKey('textInputAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0800'] component obj is: " + obj.$type);
      expect(obj.$type).assertEqual('TextInput');
      done();
    
    });

    it('apiCommponentAddJsunit_0900', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_0900 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/waterflow_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      let strJson = getInspectorByKey('waterflowAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0900'] component obj is: " + obj.$attrs.enableScrollInteraction);
      expect(obj.$attrs.enableScrollInteraction ).assertTrue();
      done();
    });

    it('apiCommponentAddJsunit_1000', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_1000 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/navigation_add',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      let strJson = getInspectorByKey('navigationAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1000'] component obj is: " + obj.$type);
      expect(obj.$type).assertEqual('Navigation');
      done();
    });

    it('apiCommponentAddJsunit_1100', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_1100 START');
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/messureSize',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('width11');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1100'] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');
      done();
    });

   it('apiCommponentAddJsunit_1200', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_1200 START');
      try {
         expect(SafeAreaType.SYSTEM).assertEqual(0);
         expect(SafeAreaType.CUTOUT).assertEqual(1);
         expect(SafeAreaType.KEYBOARD).assertEqual(2);
      } catch(err) {
        console.error("apiCommponentAddJsunit_1200 error " + JSON.stringify(err));
      }
      done();
    });

    it('apiCommponentAddJsunit_1300', 0, async (done: Function) => {
       console.info("[apiCommponentAddJsunit_1300] START" );
       ohosrouter.clear();
       ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/scroll_addattrs',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      await scrollBar.scrollToBottom();
      await CommonFunc.sleep(100);
      // wether if swipe
      let gridText = await driver.findComponent(ON.id('9'));
      let  text = await gridText.getText();
      console.info("[apiCommponentAddJsunit_1300] onScrollText: " + text);
      expect(text).assertEqual('9');
      done();
      
    });

     it('apiCommponentAddJsunit_1400', 0, async (done: Function) => {
       console.info("[apiCommponentAddJsunit_1400] START" );
       ohosrouter.clear();
       ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/listItemAddgroup',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('listattrs');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1400'] component obj is: " + obj.$type);
      expect(obj.$type).assertEqual('List');
      done();   
    });

     it('apiCommponentAddJsunit_1500', 0, async (done: Function) => {
       console.info("[apiCommponentAddJsunit_1500] START" );
       ohosrouter.clear();
       ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/navrouteradd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('addOne');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1500'] component obj is: " + obj.$type);
      expect(obj.$type).assertEqual('Navigation');
      done();   
    });

    it('apiCommponentAddJsunit_1600', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_1600] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/animateAdd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('keyImageAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1600'] component obj is: " + obj.$attrs.width);
      expect(obj.$attrs.width).assertEqual('200.00vp');
      done();
    });

    it('apiCommponentAddJsunit_1700', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_1700] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/bindConver',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('buttonAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1700'] component obj is: " + obj.$attrs.borderWidth);
      expect(obj.$attrs.borderWidth).assertEqual('0.00vp');
      done();
    });

    it('apiCommponentAddJsunit_1800', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_1800] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/common_ets_api',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('labelAAd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1800'] component obj is: " + obj.$attrs.width);
      expect(obj.$attrs.width).assertEqual('320.00vp');
      done();
    });


    it('apiCommponentAddJsunit_1900', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_1900] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/commonAdd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('commonAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1900'] component obj is: " + obj.$attrs.width);
      expect(obj.$attrs.width).assertEqual('300.00vp');
      done();
    });

    it('apiCommponentAddJsunit_2000', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_2000] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/createBuilderadd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('crateFrom');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2000'] component obj is: " + obj.$attrs.borderWidth);
      expect(obj.$attrs.borderWidth).assertEqual('0.00vp');
      done();
    });
    it('apiCommponentAddJsunit_2100', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_2100] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/dragAdd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('dragAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2100'] component obj is: " + obj.$attrs.margin);
      expect(obj.$attrs.margin).assertEqual('10.00vp');
      done();
    });
   
    it('apiCommponentAddJsunit_2200', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_2200] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/TouchAdd',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('touchAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2200'] component obj is: " + obj.$attrs.margin);
      expect(obj.$attrs.margin).assertEqual('0.00vp');
      done();
    });

    it('apiCommponentAddJsunit_2300', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_2300] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/navition3',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ArkUX_Navigation_1111');
      console.info('apiCommponentAddJsunit_2300 START  :'+ JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info("apiCommponentAddJsunit_2300 obj is: " + JSON.stringify(obj));
      let mode: string = obj.$attrs.mode
      let minContentWidth: string = obj.$attrs.minContentWidth
      let navBarWidth: string = obj.$attrs.navBarWidth
      let navBarWidthRange: string = obj.$attrs.navBarWidthRange
      expect(mode).assertEqual("NavigationMode.AUTO");
      expect(minContentWidth).assertEqual("50.00vp");
      expect(navBarWidth).assertEqual("100.00vp");
      expect(navBarWidthRange).assertEqual("50.00vp, 300.00vp");
      console.info('apiCommponentAddJsunit_2300 END ');
      done();
    });

     it('apiCommponentAddJsunit_2400', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_2400] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/richEditor',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richEditor');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2400'] component obj is: " + obj.$type);
      expect(obj.$type).assertEqual('RichEditor');
      done();
    });

     it('apiCommponentAddJsunit_2500', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_2500] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/richEditorCustomKeyBoard',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richEditor1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2500'] component obj is: " + obj.$type);
      expect(obj.$type).assertEqual('RichEditor');
      done();
    });

    it('apiCommponentAddJsunit_2600', 0, async (done: Function) => {
      console.info('apiCommponentAddJsunit_2600 START');
      try {
         expect(DialogButtonStyle.HIGHLIGHT).assertEqual(1);
      } catch(err) {
        console.error("apiCommponentAddJsunit_2600 error " + JSON.stringify(err));
      }
      done();
    });
    
    it('apiCommponentAddJsunit_2700', 0, async (done: Function) => {
      console.info("[apiCommponentAddJsunit_2700] START" );
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Scroll/lifecycle',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      }).catch((err: BusinessError) => {
        console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('S1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2700] component obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('S1');
      done();
    });
  })
}