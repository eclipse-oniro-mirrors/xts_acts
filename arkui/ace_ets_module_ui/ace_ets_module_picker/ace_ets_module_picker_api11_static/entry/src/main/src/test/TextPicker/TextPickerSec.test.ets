'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
import { RecordData } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

async function forKey(Key: string, text: string) {
  console.info("web afterEach start:" + Key);
  try {
    let backData: events_emitter.EventData = {
      data: {
        "type": Key,
        "text": text,
      } as Record<String,RecordData>
    }
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("start send emitKey");
    events_emitter.emit(backEvent, backData);
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2);
}

export default function TextPickerSec() {
  describe('TextPickerSec', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextPicker/TextPickerSec",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPickerSec state pages:" + JSON.stringify(pages));
        if (!("TextPickerSec" == pages.name)) {
          console.info("get TextPickerSec pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerSec page error " + JSON.stringify(err));
      }
      await sleep(2)
    });
    
    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0100
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0100
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "true");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0100 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0200
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0200
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "false");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0200 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0200 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("false")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0300
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0300
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPickerErr", "null");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0300 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0300 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0400
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0400
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPickerErr", "undefined");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0400 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0400 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0500
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0500
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "true");
      await sleep(1)
      await forKey("TextPicker", "false");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0500 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0500 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("false")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0600
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0600
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPickerErr", "null");
      await sleep(1)
      await forKey("TextPicker", "false");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0600 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0600 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("false")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0700
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0700
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "false");
      await sleep(1)
      await forKey("TextPickerErr", "null");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPicker');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0700 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0700 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0800
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0800
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPickerErr');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0800 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0800 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_0900
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_0900
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await forKey("TextPicker", "0");
      await sleep(1)
      try {
        let strJson = inspector.getInspectorByKey('TextPickerErr');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0900 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0900 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")

      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_0900 err  :' + JSON.stringify(err))
      }
      done()
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPicker_CanLoop_static_1000
     * @tc.name     ArkUX_Stage_TextPicker_CanLoop_static_1000
     * @tc.desc     ArkUX_Stage_TextPicker_CanLoop_static_1000
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPicker_CanLoop_static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('TextPickerNoCanLoop');
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_1000 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_1000 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').getString('canLoop')));
        expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("true")
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPicker_CanLoop_static_1000 err  :' + JSON.stringify(err))
        done()
      }
    })

    
    /**
     * @tc.number   ArkUX_Stage_TextPickerDialog_CanLoop_0100
     * @tc.name     ArkUX_Stage_TextPickerDialog_CanLoop_0100
     * @tc.desc     ArkUX_Stage_TextPickerDialog_CanLoop_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Stage_TextPickerDialog_CanLoop_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('TextPickerDialog');
        console.info('ArkUX_Stage_TextPickerDialog_CanLoop_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextPickerDialog_CanLoop_0100 obj $attrs.canLoop :' + JSON.stringify(obj.getElement('$attrs').tryGetElement('canLoop')));
        expect(obj.getElement('$attrs').tryGetElement('canLoop')).assertEqual(undefined)
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextPickerDialog_CanLoop_0100 err  :' + JSON.stringify(err))
        done()
      }
    })
  })
}