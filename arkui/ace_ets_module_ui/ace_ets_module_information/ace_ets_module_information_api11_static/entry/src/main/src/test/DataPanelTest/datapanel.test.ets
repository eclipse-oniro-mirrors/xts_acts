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
import { UIContext, Router, Context } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import accessibility from '@ohos.accessibility';
import { Resource, $r, ResourceStr} from '@ohos.arkui.component'
import common from '@ohos.app.ability.common';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

let emitKey = "emitUserAgent";

function spliceColor(sysColor: Resource) {
  let resourceColor =  AppStorage.get<common.Context>('applicationContext')?.resourceManager.getColorSync(sysColor.id)!
  let newArgb: string = '#' + resourceColor.toString(16).toUpperCase()
  return newArgb;
}

function dataPanelDefaultStrokeWidth(sysWidth: Resource) {
  // let resourceStrokeWidth = AppStorage.get<common.Context>('applicationContext')?.resourceManager.getNumber(sysWidth.id)
  // let newStrokeWidth: string = Math.round(px2vp(resourceStrokeWidth)) + '.00vp'
  // return newStrokeWidth;
}

export default function datapanelTest() {
  describe('ActsDatapanelTest', () => {
    beforeAll(() => {
      console.info("ActsDatapanelTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DataPanel/DataPanel_001",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DataPanel state success " + JSON.stringify(pages));
        if (!("DataPanel" == pages.name)) {
          console.info("get DataPanel state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push DataPanel page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("DataPanel beforeEach start");
    })

    
    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0100
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0100
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0100');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0100 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0200
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0200
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0200');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0200 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0300
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0300
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0300');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0300 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0400
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0400
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0400');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0400 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0500
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0500
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0500');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0500 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0500 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0600
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0600
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0600');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0600 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0600 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0600 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0700
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0700
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0700');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0700 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0700 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0700 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0800
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0800
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0800');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0800 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0800 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0800 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_0900
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_0900
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0900 START');
      let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0900');
      console.info('ArkUX_Stage_DataPanel_ValueColors_0900 strJson  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("ArkUX_Stage_DataPanel_ValueColors_0900 component obj is: " + JSON.stringify(obj));
      console.info("ArkUX_Stage_DataPanel_ValueColors_0900 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("ArkUX_Stage_DataPanel_ValueColors_0900 component obj.$attrs.valueColors is: " +
      JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('offset')).assertEqual("1.000000");
      console.info('ArkUX_Stage_DataPanel_ValueColors_0900 END ');
      done();
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1000
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1000
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1000');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1000 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1000 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1000 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1100
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1100
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1100');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1100 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1200
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1200
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1200');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1200 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1300
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1300
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1300');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1300 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1400
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1400
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1400');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1400 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1500
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1500
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1500');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1500 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1500 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect((obj.getElement('$attrs').getArray('valueColors')[2].asArray())[0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1600
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1600
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1600 START');
      let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1600');
      console.info('ArkUX_Stage_DataPanel_ValueColors_1600 strJson  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("ArkUX_Stage_DataPanel_ValueColors_1600 component obj is: " + JSON.stringify(obj));
      console.info("ArkUX_Stage_DataPanel_ValueColors_1600 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("ArkUX_Stage_DataPanel_ValueColors_1600 component obj.$attrs.valueColors is: " +
      JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('offset')).assertEqual("1.000000");
      console.info('ArkUX_Stage_DataPanel_ValueColors_1600 END ');
      done();
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1700
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1700
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1700');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1700 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1700 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1700 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#4CFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#4CFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#9AFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#9AFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1800
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1800
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1800');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1800 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1800 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1800 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#00FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#00FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#00FFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#00FFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#00FFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#00FFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#00008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#00008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_1900
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_1900
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_1900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1900');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1900 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1900 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1900 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2000
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2000
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2000');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2000 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2000 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2000 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#4CFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#4CFF0000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#9AC0CB00");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#9AC0CB00");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2100
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2100
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2100');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2100 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2200
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2200
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2200');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2200 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#4CFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#4CFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#9AFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#9AFFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2300
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2300
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2300 START');
      let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2300');
      console.info('ArkUX_Stage_DataPanel_ValueColors_2300 strJson  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("ArkUX_Stage_DataPanel_ValueColors_2300 component obj is: " + JSON.stringify(obj));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2300 component obj.$attrs.valueColors is: " +
      JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('offset')).assertEqual("1.000000");
      console.info('ArkUX_Stage_DataPanel_ValueColors_2300 END ');
      done();
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2400
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2400
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2400 START');
      let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2400');
      console.info('ArkUX_Stage_DataPanel_ValueColors_2400 strJson  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("ArkUX_Stage_DataPanel_ValueColors_2400 component obj is: " + JSON.stringify(obj));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2400 component obj.$attrs.valueColors is: " +
      JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('offset')).assertEqual("1.000000");
      console.info('ArkUX_Stage_DataPanel_ValueColors_2400 END ');
      done();
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2500
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2500
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2500 START');
      let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2500');
      console.info('ArkUX_Stage_DataPanel_ValueColors_2500 strJson  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("ArkUX_Stage_DataPanel_ValueColors_2500 component obj is: " + JSON.stringify(obj));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2500 component obj.$attrs.valueColors is: " +
      JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('offset')).assertEqual("1.000000");
      console.info('ArkUX_Stage_DataPanel_ValueColors_2500 END ');
      done();
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2600
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2600
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2600 START');
      let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2600');
      console.info('ArkUX_Stage_DataPanel_ValueColors_2600 strJson  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("ArkUX_Stage_DataPanel_ValueColors_2600 component obj is: " + JSON.stringify(obj));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2600 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2600 component obj.$attrs.valueColors is: " +
      JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('offset')).assertEqual("1.000000");
      console.info('ArkUX_Stage_DataPanel_ValueColors_2600 END ');
      done();
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2700
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2700
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2700 START');

      let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2700');
      console.info('ArkUX_Stage_DataPanel_ValueColors_2700 strJson  :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("ArkUX_Stage_DataPanel_ValueColors_2700 component obj is: " + JSON.stringify(obj));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2700 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("ArkUX_Stage_DataPanel_ValueColors_2700 component obj.$attrs.valueColors is: " +
      JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color1_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color2_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color3_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color4_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color5_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[4][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color6_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[5][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color7_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[6][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color8_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[7][1].getString('offset')).assertEqual("1.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_start')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][0].getString('offset')).assertEqual("0.000000");
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('color')).assertEqual(spliceColor($r('sys.color.ohos_id_color_datapanel_color9_end')));
      expect(obj.getElement('$attrs').getArray('valueColors')[8][1].getString('offset')).assertEqual("1.000000");
      console.info('ArkUX_Stage_DataPanel_ValueColors_2700 END ');
      done();
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2800
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2800
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2800');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2800 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2800 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2800 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#4C800080");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#4C800080");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('color')).assertEqual("#9AFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('color')).assertEqual("#9AFFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[3][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_ValueColors_static_2900
     * @tc.name     ArkUX_Stage_DataPanel_ValueColors_static_2900
     * @tc.desc     ArkUX_Stage_DataPanel_ValueColors_static_2900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_ValueColors_static_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2900');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2900 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2900 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2900 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.getElement('$attrs').getArray('valueColors')));
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('color')).assertEqual("#01FFA500");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('color')).assertEqual("#01FFFF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('color')).assertEqual("#01FFC0CB");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('color')).assertEqual("#0100FF00");
          expect(obj.getElement('$attrs').getArray('valueColors')[1][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0100
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0100
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0100');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0100 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual('#FF00FF00');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0200
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0200
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0200');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0200 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual('#FF00FF00');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0300
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0300
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0300');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0300 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual('#FF008000');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0400
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0400
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0400');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0400 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual('#FF00FF00');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0500
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0500
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0500');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0500 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0500 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual('#FFFFFF00');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0600
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0600
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0600');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0600 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0600 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual('#FF0000FF');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0700
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0700
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0700');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0700 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0700 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0800
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0800
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0800');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0800 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0800 component obj.getElement('$attrs') is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0800 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0900
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0900
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_0900');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0900 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_0900 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_1000
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_1000
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_1000');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_1000 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_1000 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackBackgroundColor_static_1100
     * @tc.name     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_1100
     * @tc.desc     ArkUX_Stage_DataPanel_TrackBackgroundColor_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackBackgroundColor_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackBackgroundColor_1100');
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_1100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackBackgroundColor_1100 component obj.$attrs.trackBackgroundColor is:" +
          JSON.stringify(obj.getElement('$attrs').getString('trackBackgroundColor')));
          expect(obj.getElement('$attrs').getString('trackBackgroundColor')).assertEqual(obj.getElement('$attrs').getString('borderColor'));
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackBackgroundColor_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_StrokeWidth_static_0100
     * @tc.name     ArkUX_Stage_DataPanel_StrokeWidth_static_0100
     * @tc.desc     ArkUX_Stage_DataPanel_StrokeWidth_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_StrokeWidth_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_StrokeWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_StrokeWidth_0100');
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0100 component obj.$attrs.strokeWidth is: " +
          JSON.stringify(obj.getElement('$attrs').getString('strokeWidth')));
          expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual("30.00vp");
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_StrokeWidth_static_0200
     * @tc.name     ArkUX_Stage_DataPanel_StrokeWidth_static_0200
     * @tc.desc     ArkUX_Stage_DataPanel_StrokeWidth_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_StrokeWidth_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_StrokeWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_StrokeWidth_0200');
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0200 component obj.getElement('$attrs') is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0200 component obj.$attrs.strokeWidth is: " +
          JSON.stringify(obj.getElement('$attrs').getString('strokeWidth')));
          expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual("30.00vp");
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_StrokeWidth_static_0300
     * @tc.name     ArkUX_Stage_DataPanel_StrokeWidth_static_0300
     * @tc.desc     ArkUX_Stage_DataPanel_StrokeWidth_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_StrokeWidth_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_StrokeWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_StrokeWidth_0300');
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0300 component obj.$attrs.strokeWidth is: " +
          JSON.stringify(obj.getElement('$attrs').getString('strokeWidth')));
          expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual("30.00vp");
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_StrokeWidth_static_0400
     * @tc.name     ArkUX_Stage_DataPanel_StrokeWidth_static_0400
     * @tc.desc     ArkUX_Stage_DataPanel_StrokeWidth_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_StrokeWidth_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_StrokeWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_StrokeWidth_0400');
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0400 component obj.$attrs.strokeWidth is: " +
          JSON.stringify(obj.getElement('$attrs').getString('strokeWidth')));
          // expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual(dataPanelDefaultStrokeWidth($r('sys.float.ohos_id_datapanel_thickness')));
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_StrokeWidth_static_0500
     * @tc.name     ArkUX_Stage_DataPanel_StrokeWidth_static_0500
     * @tc.desc     ArkUX_Stage_DataPanel_StrokeWidth_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_StrokeWidth_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_StrokeWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_StrokeWidth_0500');
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0500 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0500 component obj.$attrs.strokeWidth is: " +
          JSON.stringify(obj.getElement('$attrs').getString('strokeWidth')));
          // expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual(dataPanelDefaultStrokeWidth($r('sys.float.ohos_id_datapanel_thickness')));
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_StrokeWidth_static_0600
     * @tc.name     ArkUX_Stage_DataPanel_StrokeWidth_static_0600
     * @tc.desc     ArkUX_Stage_DataPanel_StrokeWidth_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_StrokeWidth_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_StrokeWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_StrokeWidth_0600');
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0600 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0600 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_StrokeWidth_0600 component obj.$attrs.strokeWidth is: " +
          JSON.stringify(obj.getElement('$attrs').getString('strokeWidth')));
          // expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual(dataPanelDefaultStrokeWidth($r('sys.float.ohos_id_datapanel_thickness')));
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_StrokeWidth_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0100
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0100
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0100');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0100 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          let trackShadow = obj.getElement('$attrs').getElement('trackShadow');
          hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(trackShadow.getString('radius')));
          expect(trackShadow.getString('radius')).assertEqual("20.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0200
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0200
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0200');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0200 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0300
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0300
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0300');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0300 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0400
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0400
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0400');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0400 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0500
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0500
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0500');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0500 strJson  :' + strJson);
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0500 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0500 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('radius')).assertEqual("20.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0600
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0600
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0600');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0600 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0600 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0600 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("15.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0700
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0700
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0700');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0700 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0700 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0700 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("-10.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0800
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0800
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0800');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0800 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0800 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0800 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_0900
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_0900
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_0900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_0900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_0900');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0900 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0900 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_0900 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1000
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1000
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1000');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1000 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1000 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1000 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetX')).assertEqual("5.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1100
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1100
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1100');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1100 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1100 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("15.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1200
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1200
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1200');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1200 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1200 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("-10.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1300
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1300
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1300');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1300 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1300 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1400
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1400
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1400');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1400 component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1400 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1500
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1500
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1500');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1500 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1500 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1500 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getString('offsetY')).assertEqual("5.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1600
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1600
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1600');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1600 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1600 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1600 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1700
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1700
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1700
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1700 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1700');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1700 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1700 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1700 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1800
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1800
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1800
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1800 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1800');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1800 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1800 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1800 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_1900
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_1900
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_1900
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_1900 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_1900');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1900 strJson  :' + strJson);
          let obj = JSON.parseJsonElement(strJson);
          console.info(" component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1900 component obj.$attrs is: " +
          JSON.stringifyJsonElement(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_1900 component obj.$attrs.trackShadow is: " +
          JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('trackShadow')));
          hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_1900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_2300
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_2300
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_2300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_2300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_2300');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2300 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2300 component obj.getElement('$attrs').getElement('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_2400
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_2400
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_2400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_2400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_2400');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2400 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2400 component obj.getElement('$attrs').getString('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_2500
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_2500
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_2500
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_2500 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_2500');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2500 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2500 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2500 component obj.getElement('$attrs').getElement('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FF008000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_2600
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_2600
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_2600
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_2600 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_2600');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2600 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2600 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_2600 component obj.getElement('$attrs').getElement('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FFFFFF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[3][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[3][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[3][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[3][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[4][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[4][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[4][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[4][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[5][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[5][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[5][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[5][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_2600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_3000
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_3000
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_3000
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_3000 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_3000');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3000 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3000 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3000 component obj.getElement('$attrs').getElement('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_3100
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_3100
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_3100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_3100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_3100');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3100 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3100 component obj.getElement('$attrs').getElement('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_3200
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_3200
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_3200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_3200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_3200');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3200 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3200 component obj.getElement('$attrs').getElement('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FFFFA500");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });


    /**
     * @tc.number   ArkUX_Stage_DataPanel_TrackShadow_static_3300
     * @tc.name     ArkUX_Stage_DataPanel_TrackShadow_static_3300
     * @tc.desc     ArkUX_Stage_DataPanel_TrackShadow_static_3300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_DataPanel_TrackShadow_static_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_DataPanel_TrackShadow_3300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_DataPanel_TrackShadow_3300');
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3300 component obj.$attrs is: " +
          JSON.stringify(obj.getElement('$attrs')));
          console.info("ArkUX_Stage_DataPanel_TrackShadow_3300 component obj.getElement('$attrs').getElement('trackShadow') is: " +
          JSON.stringify(obj.getElement('$attrs').getElement('trackShadow')));
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('color')).assertEqual("#FFFFC0CB");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[0][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('color')).assertEqual("#FF00FF00");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[1][1].getString('offset')).assertEqual("1.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][0].getString('offset')).assertEqual("0.000000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('color')).assertEqual("#FFFF0000");
          expect(obj.getElement('$attrs').getElement('trackShadow').getArray('colors')[2][1].getString('offset')).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_TrackShadow_3300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}