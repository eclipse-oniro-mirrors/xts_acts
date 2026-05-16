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

import { afterEach, beforeEach, describe, expect, it, beforeAll,Level } from '../../../../hypium/index';
import router from '@ohos.router';

import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function columnJsunit() {
  describe('columnTest', () => {
    beforeAll(() => {
      console.info("columnTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("columnTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/Column',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Column state success " + "");
        if (!("Column" == pages.name)) {
          console.info("get Column state success " + "");
          
          routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000)
          
        }
      } catch (err) {
        console.error("push Column page error " + JSON.stringify(err));
      }
      await UtilsTest.msSleep(2000)
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000)
      console.info("Column after each called");
    });

    
    
    

/**
     * @tc.number   testColumn010_static_01
     * @tc.name     testColumn010_static_01
     * @tc.desc     testColumn010_static_01
     * @tc.level    Level.LEVEL0
     */
it('testColumn010_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testColumn010_static_01 START');
      let strJson = inspector.getInspectorByKey('column');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual('Column');
     console.info("yr new Column0-Column: " + JSON.stringify(obj.getString('$type')));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.Center');
     console.log("yr new Column0 alignItems-'HorizontalAlign.Center':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testColumn010_static_01 END');
      done();
    });

    
    
    

/**
     * @tc.number   testColumn020_static_02
     * @tc.name     testColumn020_static_02
     * @tc.desc     testColumn020_static_02
     * @tc.level    Level.LEVEL0
     */
it('testColumn020_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testColumn020_static_02 START');
      let strJson = inspector.getInspectorByKey('column1');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.Start');
     console.log("yr new Column1 alignItems-'HorizontalAlign.Start':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testColumn020_static_02 END');
      done();
    });

    
    
    

/**
     * @tc.number   testColumn030_static_03
     * @tc.name     testColumn030_static_03
     * @tc.desc     testColumn030_static_03
     * @tc.level    Level.LEVEL0
     */
it('testColumn030_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testColumn030_static_03 START');
      let strJson = inspector.getInspectorByKey('column2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.End');
     console.log("yr new Column2 alignItems-'HorizontalAlign.End':" + JSON.stringify(obj.getElement('$attrs').getString('alignItems')));
      console.info('testColumn030_static_03 END');
      done();
    });
  })
}
