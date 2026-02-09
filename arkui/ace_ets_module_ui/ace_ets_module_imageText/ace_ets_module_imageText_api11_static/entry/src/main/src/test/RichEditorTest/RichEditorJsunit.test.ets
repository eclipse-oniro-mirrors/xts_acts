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
import { CopyOptions } from '@ohos.arkui.component'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it,expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { MessageManagerBase } from '../../../ets/MainAbility/common/MessageManager2';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function richEditorTest() {
  describe('richEditorTest',() => {
    beforeEach(async (): Promise<void> => {
      console.info("richEditorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/richEditorPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get richEditorTest state pages:" + JSON.stringify(pages));
        if (!("richEditorPage" == pages.name)) {
          console.info("get richEditorTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push richEditorTest page error:" + err);
      }
      console.info("richEditorTest beforeEach end");
    });
    beforeAll(() => {
      console.info("richEditorTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richEditorTest after each called");
    });

    afterEach(async  () => {
      await CommonFunc.sleep(1000)
      console.info("RichEditor after each called");
    })

    
    /**
     * @tc.number   testRichEditorCopyOptions_static_01
     * @tc.name     testRichEditorCopyOptions_static_01
     * @tc.desc     testRichEditorCopyOptions_static_01
     * @tc.level    Level.LEVEL0
     */
    it('testRichEditorCopyOptions_static_01', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'testRichEditorCopyOptions01';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        AppStorage.get<MessageManagerBase<CopyOptions>>("messageManagerRichEditorPage")?.notify({
          name: 'typeValue', value: CopyOptions.None
        });
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('key_RichEditor');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component copyOption is: ' +  obj.getElement('$attrs').getString('copyOption'));
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.None");
     expect(obj.getString('$type')).assertEqual('RichEditor');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

         
    /**
     * @tc.number   testRichEditorCopyOptions_static_02
     * @tc.name     testRichEditorCopyOptions_static_02
     * @tc.desc     testRichEditorCopyOptions_static_02
     * @tc.level    Level.LEVEL0
     */
    it('testRichEditorCopyOptions_static_02', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'testRichEditorCopyOptions02';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        AppStorage.get<MessageManagerBase<CopyOptions>>("messageManagerRichEditorPage")?.notify({
          name: 'typeValue', value: CopyOptions.InApp
        });
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('key_RichEditor');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component copyOption is: ' + obj.getElement('$attrs').getString('copyOption'));
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.InApp");
      console.info('[' + tagName + '] END ===========================');
      done();
    });

           
    /**
     * @tc.number   testRichEditorCopyOptions_static_03
     * @tc.name     testRichEditorCopyOptions_static_03
     * @tc.desc     testRichEditorCopyOptions_static_03
     * @tc.level    Level.LEVEL0
     */
    it('testRichEditorCopyOptions_static_03', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'testRichEditorCopyOptions03';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        AppStorage.get<MessageManagerBase<CopyOptions>>("messageManagerRichEditorPage")?.notify({
          name: 'typeValue', value: CopyOptions.LocalDevice
        });
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('key_RichEditor');
      let obj = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] component copyOption is: ' + obj.getElement('$attrs').getString('copyOption'));
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.Local");
      expect(obj.getString('$type')).assertEqual('RichEditor');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

          
    // /*
    //  * @tc.number   testRichEditorCopyOptions_static_04
    //  * @tc.name     testRichEditorCopyOptions_static_04
    //  * @tc.desc     testRichEditorCopyOptions_static_04
    //  * @tc.level    Level.LEVEL0
    //  */
    // it('testRichEditorCopyOptions_static_04', Level.LEVEL0, async (done: ()=>void) => {
    //   let tagName = 'testRichEditorCopyOptions04';
    //   console.info('[' + tagName + '] START============================');
    //   await Utils.sleep(1000)
    //
    //   try {
    //     AppStorage.get<MessageManagerBase<CopyOptions>>("messageManagerRichEditorPage")?.notify({
    //       name: 'typeValue', value: CopyOptions.CROSS_DEVICE // 不存在的枚举值
    //     });
    //   } catch (err:Error) {
    //     console.log('[' + tagName + '] change component data error: ' + err.message);
    //   }
    //   await Utils.sleep(2000);
    //   let strJsonNew = inspector.getInspectorByKey('key_RichEditor');
    //   let obj = JSON.parseJsonElement(strJsonNew);
    //   console.info('[' + tagName + '] component copyOption is: ' + obj.getElement('$attrs').getString('copyOption'));
    //   expect(obj.getElement('$attrs').getString('copyOption')).assertEqual("CopyOptions.Distributed");
    //   expect(obj.getString('$type')).assertEqual('RichEditor');
    //   console.info('[' + tagName + '] END ===========================');
    //   done();
    // });
  })  
}
