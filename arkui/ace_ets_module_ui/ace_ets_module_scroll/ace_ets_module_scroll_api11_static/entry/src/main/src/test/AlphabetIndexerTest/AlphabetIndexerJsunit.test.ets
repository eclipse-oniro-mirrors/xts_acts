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
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, (time * 1000).toInt())
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function alphabetIndexerJsunit() {
  describe('alphabetIndexerTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexer/AlphabetIndexer',
      }
      try {
        const routerAlp = AppStorage.get<Router>("router") as Router
        routerAlp.clear();
        let pages = routerAlp.getState();
        console.info("get AlphabetIndexer state success " + JSON.stringify(pages));
        if (!("AlphabetIndexer" == pages.name)) {
          console.info("get AlphabetIndexer state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          // console.info("push AlphabetIndexer page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlphabetIndexer page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("AlphabetIndexer after each called");
    });


    
    /**
     * @tc.number   alphabetIndexerTest001_static_01
     * @tc.name     alphabetIndexerTest001_static_01
     * @tc.desc     alphabetIndexerTest001_static_01
     * @tc.level    Level.LEVEL0
     */
it('alphabetIndexerTest001_static_01', Level.LEVEL0, async () => {
      console.info('AlphabetIndexerTest001_static_01 START');
      await sleep(1)
      let strJson = inspector.getInspectorByKey('alphabetIndexer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('AlphabetIndexer');
      console.info('AlphabetIndexerTest001_static_01 END');
    });


    
    /**
     * @tc.number   alphabetIndexerTest002_static_02
     * @tc.name     alphabetIndexerTest002_static_02
     * @tc.desc     alphabetIndexerTest002_static_02
     * @tc.level    Level.LEVEL0
     */
it('alphabetIndexerTest002_static_02', Level.LEVEL0, async () => {
      try {
        console.info('AlphabetIndexerTest002_static_02 START');
        let strJson = inspector.getInspectorByKey('alphabetIndexer1');
        let obj = JSON.parseJsonElement(strJson);
        console.info("component obj is: " + JSON.stringify(obj));
        console.info('AlphabetIndexerTest002_static_02 END');
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
