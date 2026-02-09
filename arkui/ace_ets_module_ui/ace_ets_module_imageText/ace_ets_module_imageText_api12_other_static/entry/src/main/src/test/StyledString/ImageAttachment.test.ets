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

import router from '@ohos.router';

import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ImageAttachment() {
  describe('ImageAttachment', () => {
    beforeAll(() => {
      console.info("ImageAttachment beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageAttachment beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ImageAttachment',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ImageAttachment state pages:" + JSON.stringify(pages));
        if (!("ImageAttachment" == pages.name)) {
          console.info("get ImageAttachment pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ImageAttachment page error: " + err);
      }
      // done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageAttachment after each called");
    });


    
    
    


/**
     * @tc.number   ImageAttachment_static_0001
     * @tc.name     ImageAttachment_static_0001
     * @tc.desc     ImageAttachment_static_0001
     * @tc.level    Level.LEVEL1
     */
it('ImageAttachment_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment_static_0001 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage1'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      get!.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment_static_0001_static marginTop ' + AppStorage.get<string>('marginTop'));
      expect('' + AppStorage.get<string>('marginTop')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0001_static marginRight ' +
      AppStorage.get<string>('marginRight'));
      expect('' + AppStorage.get<string>('marginRight')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0001_static marginBottom ' +
      AppStorage.get<string>('marginBottom'));
      expect('' + AppStorage.get<string>('marginBottom')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0001_static marginLeft ' +
      AppStorage.get<string>('marginLeft'));
      expect('' + AppStorage.get<string>('marginLeft')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0001_static paddingTop ' +
      AppStorage.get<string>('paddingTop'));
      expect('' + AppStorage.get<string>('paddingTop')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0001_static paddingRight ' +
      AppStorage.get<string>('paddingRight'));
      expect('' + AppStorage.get<string>('paddingRight')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0001_static paddingBottom ' +
      AppStorage.get<string>('paddingBottom'));
      expect('' + AppStorage.get<string>('paddingBottom')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0001_static paddingLeft ' +
      AppStorage.get<string>('paddingLeft'));
      expect('' + AppStorage.get<string>('paddingLeft')).assertEqual('10');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment_static_0001_static] end");
      done();
    });


    
    
    


/**
     * @tc.number   ImageAttachment_static_0002
     * @tc.name     ImageAttachment_static_0002
     * @tc.desc     ImageAttachment_static_0002
     * @tc.level    Level.LEVEL1
     */
it('ImageAttachment_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment_static_0002 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage2'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      get!.click()
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment_static_0002_static marginTop ' + AppStorage.get<string>('marginTop'));
      expect('' + AppStorage.get<string>('marginTop')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0002_static marginRight ' +
      AppStorage.get<string>('marginRight'));
      expect('' + AppStorage.get<string>('marginRight')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0002_static marginBottom ' +
      AppStorage.get<string>('marginBottom'));
      expect('' + AppStorage.get<string>('marginBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0002_static marginLeft ' +
      AppStorage.get<string>('marginLeft'));
      expect('' + AppStorage.get<string>('marginLeft')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0002_static paddingTop ' +
      AppStorage.get<string>('paddingTop'));
      expect('' + AppStorage.get<string>('paddingTop')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0002_static paddingRight ' +
      AppStorage.get<string>('paddingRight'));
      expect('' + AppStorage.get<string>('paddingRight')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0002_static paddingBottom ' +
      AppStorage.get<string>('paddingBottom'));
      expect('' + AppStorage.get<string>('paddingBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0002_static paddingLeft ' +
      AppStorage.get<string>('paddingLeft'));
      expect('' + AppStorage.get<string>('paddingLeft')).assertEqual('0');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment_static_0002_static] end");
      done();
    });


    
    
    


/**
     * @tc.number   ImageAttachment_static_0003
     * @tc.name     ImageAttachment_static_0003
     * @tc.desc     ImageAttachment_static_0003
     * @tc.level    Level.LEVEL1
     */
//it('ImageAttachment_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   let driver = Driver.create();
    //   console.info('StyledString ImageAttachment_static_0003 START');
    //   await CommonFunc.sleep(1000);
    //   let set = await driver.findComponent(ON.id('setImage3'))
    //   await CommonFunc.sleep(500);
    //   set!.click();
    //   await CommonFunc.sleep(500);
    //   let get = await driver.findComponent(ON.id('getImage'))
    //   await CommonFunc.sleep(500);
    //   get!.click()
    //   await CommonFunc.sleep(500);
    //   console.info('StyledString ImageAttachment_static_0003_static marginTop ' + AppStorage.get<string>('marginTop'));
    //   expect('' + AppStorage.get<string>('marginTop')).assertEqual('0');
    //   console.info('StyledString ImageAttachment_static_0003_static marginRight ' +
    //   AppStorage.get<string>('marginRight'));
    //   expect('' + AppStorage.get<string>('marginRight')).assertEqual('0');
    //   console.info('StyledString ImageAttachment_static_0003_static marginBottom ' +
    //   AppStorage.get<string>('marginBottom'));
    //   expect('' + AppStorage.get<string>('marginBottom')).assertEqual('0');
    //   console.info('StyledString ImageAttachment_static_0003_static marginLeft ' +
    //   AppStorage.get<string>('marginLeft'));
    //   expect('' + AppStorage.get<string>('marginLeft')).assertEqual('0');
    //   console.info('StyledString ImageAttachment_static_0003_static paddingTop ' +
    //   AppStorage.get<string>('paddingTop'));
    //   expect('' + AppStorage.get<string>('paddingTop')).assertEqual('0');
    //   console.info('StyledString ImageAttachment_static_0003_static paddingRight ' +
    //   AppStorage.get<string>('paddingRight'));
    //   expect('' + AppStorage.get<string>('paddingRight')).assertEqual('0');
    //   console.info('StyledString ImageAttachment_static_0003_static paddingBottom ' +
    //   AppStorage.get<string>('paddingBottom'));
    //   expect('' + AppStorage.get<string>('paddingBottom')).assertEqual('0');
    //   console.info('StyledString ImageAttachment_static_0003_static paddingLeft ' +
    //   AppStorage.get<string>('paddingLeft'));
    //   expect('' + AppStorage.get<string>('paddingLeft')).assertEqual('0');
    //   AppStorage.delete('marginTop')
    //   AppStorage.delete('marginRight')
    //   AppStorage.delete('marginBottom')
    //   AppStorage.delete('marginLeft')
    //   AppStorage.delete('paddingTop')
    //   AppStorage.delete('paddingRight')
    //   AppStorage.delete('paddingBottom')
    //   AppStorage.delete('paddingLeft')
    //   console.info("[ImageAttachment_static_0003_static] end");
    //   done();
    // });


    
    
    


/**
     * @tc.number   ImageAttachment_static_0004
     * @tc.name     ImageAttachment_static_0004
     * @tc.desc     ImageAttachment_static_0004
     * @tc.level    Level.LEVEL1
     */
it('ImageAttachment_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment_static_0004 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage4'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      get!.click()
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment_static_0004_static marginTop ' + AppStorage.get<string>('marginTop'));
      expect('' + AppStorage.get<string>('marginTop')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0004_static marginRight ' +
      AppStorage.get<string>('marginRight'));
      expect('' + AppStorage.get<string>('marginRight')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0004_static marginBottom ' +
      AppStorage.get<string>('marginBottom'));
      expect('' + AppStorage.get<string>('marginBottom')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0004_static marginLeft ' +
      AppStorage.get<string>('marginLeft'));
      expect('' + AppStorage.get<string>('marginLeft')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0004_static paddingTop ' +
      AppStorage.get<string>('paddingTop'));
      expect('' + AppStorage.get<string>('paddingTop')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0004_static paddingRight ' +
      AppStorage.get<string>('paddingRight'));
      expect('' + AppStorage.get<string>('paddingRight')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0004_static paddingBottom ' +
      AppStorage.get<string>('paddingBottom'));
      expect('' + AppStorage.get<string>('paddingBottom')).assertEqual('10');
      console.info('StyledString ImageAttachment_static_0004_static paddingLeft ' +
      AppStorage.get<string>('paddingLeft'));
      expect('' + AppStorage.get<string>('paddingLeft')).assertEqual('10');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment_static_0004_static] end");
      done();
    });


    
    
    


/**
     * @tc.number   ImageAttachment_static_0005
     * @tc.name     ImageAttachment_static_0005
     * @tc.desc     ImageAttachment_static_0005
     * @tc.level    Level.LEVEL1
     */
it('ImageAttachment_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('StyledString ImageAttachment_static_0005 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setImage5'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getImage'))
      await CommonFunc.sleep(500);
      get!.click()
      await CommonFunc.sleep(500);
      console.info('StyledString ImageAttachment_static_0005_static marginTop ' + AppStorage.get<string>('marginTop'));
      expect('' + AppStorage.get<string>('marginTop')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0005_static marginRight ' +
      AppStorage.get<string>('marginRight'));
      expect('' + AppStorage.get<string>('marginRight')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0005_static marginBottom ' +
      AppStorage.get<string>('marginBottom'));
      expect('' + AppStorage.get<string>('marginBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0005_static marginLeft ' +
      AppStorage.get<string>('marginLeft'));
      expect('' + AppStorage.get<string>('marginLeft')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0005_static paddingTop ' +
      AppStorage.get<string>('paddingTop'));
      expect('' + AppStorage.get<string>('paddingTop')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0005_static paddingRight ' +
      AppStorage.get<string>('paddingRight'));
      expect('' + AppStorage.get<string>('paddingRight')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0005_static paddingBottom ' +
      AppStorage.get<string>('paddingBottom'));
      expect('' + AppStorage.get<string>('paddingBottom')).assertEqual('0');
      console.info('StyledString ImageAttachment_static_0005_static paddingLeft ' +
      AppStorage.get<string>('paddingLeft'));
      expect('' + AppStorage.get<string>('paddingLeft')).assertEqual('0');
      AppStorage.delete('marginTop')
      AppStorage.delete('marginRight')
      AppStorage.delete('marginBottom')
      AppStorage.delete('marginLeft')
      AppStorage.delete('paddingTop')
      AppStorage.delete('paddingRight')
      AppStorage.delete('paddingBottom')
      AppStorage.delete('paddingLeft')
      console.info("[ImageAttachment_static_0005_static] end");
      done();
    });


    
    
    


/**
     * @tc.number   ImageAttachment_static_0006
     * @tc.name     ImageAttachment_static_0006
     * @tc.desc     ImageAttachment_static_0006
     * @tc.level    Level.LEVEL1
     */
//it('ImageAttachment_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   let driver = Driver.create();
    //   console.info('StyledString ImageAttachment_static_0006 START');
    //   await CommonFunc.sleep(1000);
    //   let set = await driver.findComponent(ON.id('setImage6'))
    //   await CommonFunc.sleep(500);
    //   set!.click();
    //   await CommonFunc.sleep(500);
    //   let get = await driver.findComponent(ON.id('getImage'))
    //   await CommonFunc.sleep(500);
    //   get!.click()
    //   await CommonFunc.sleep(500);
    //   console.info('StyledString ImageAttachment_static_0006_static marginTop ' + AppStorage.get<string>('marginTop'));
    //   expect('' + AppStorage.get<string>('marginTop')).assertEqual('undefined');
    //   console.info('StyledString ImageAttachment_static_0006_static marginRight ' +
    //   AppStorage.get<string>('marginRight'));
    //   expect('' + AppStorage.get<string>('marginRight')).assertEqual('undefined');
    //   console.info('StyledString ImageAttachment_static_0006_static marginBottom ' +
    //   AppStorage.get<string>('marginBottom'));
    //   expect('' + AppStorage.get<string>('marginBottom')).assertEqual('undefined');
    //   console.info('StyledString ImageAttachment_static_0006_static marginLeft ' +
    //   AppStorage.get<string>('marginLeft'));
    //   expect('' + AppStorage.get<string>('marginLeft')).assertEqual('undefined');
    //   console.info('StyledString ImageAttachment_static_0006_static paddingTop ' +
    //   AppStorage.get<string>('paddingTop'));
    //   expect('' + AppStorage.get<string>('paddingTop')).assertEqual('undefined');
    //   console.info('StyledString ImageAttachment_static_0006_static paddingRight ' +
    //   AppStorage.get<string>('paddingRight'));
    //   expect('' + AppStorage.get<string>('paddingRight')).assertEqual('undefined');
    //   console.info('StyledString ImageAttachment_static_0006_static paddingBottom ' +
    //   AppStorage.get<string>('paddingBottom'));
    //   expect('' + AppStorage.get<string>('paddingBottom')).assertEqual('undefined');
    //   console.info('StyledString ImageAttachment_static_0006_static paddingLeft ' +
    //   AppStorage.get<string>('paddingLeft'));
    //   expect('' + AppStorage.get<string>('paddingLeft')).assertEqual('undefined');
    //   AppStorage.delete('marginTop')
    //   AppStorage.delete('marginRight')
    //   AppStorage.delete('marginBottom')
    //   AppStorage.delete('marginLeft')
    //   AppStorage.delete('paddingTop')
    //   AppStorage.delete('paddingRight')
    //   AppStorage.delete('paddingBottom')
    //   AppStorage.delete('paddingLeft')
    //   console.info("[ImageAttachment_static_0006_static] end");
    //   done();
    // });
  })
}