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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, (time * 1000).toInt())
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}


export default function gridItemJsunit() {

  describe('gridItemTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/grid/GridItem',
      }
      const routerAlp = AppStorage.get<Router>("router") as Router
      try {
        routerAlp.clear();
        await sleep(1);
        let pages = routerAlp.getState();
        console.info("get GridItem state success " + JSON.stringify(pages));
        if (!("GridItem" == pages.name)) {
          console.info("get GridItem state success " + JSON.stringify(pages.name));
          // let result = await routerAlp.pushUrl(options)
          routerAlp.pushUrl(options)
          // console.info("push GridItem page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridItem page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("GridItem after each called");
    });


    
    /**
     * @tc.number   gridItemTest001_static_01
     * @tc.name     gridItemTest001_static_01
     * @tc.desc     gridItemTest001_static_01
     * @tc.level    Level.LEVEL0
     */
it('gridItemTest001_static_01', Level.LEVEL0, async () => {
      console.info('gridItemTest001_static_01 START');
      await sleep(1)
      let strJson = inspector.getInspectorByKey('GridItem1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("属性值集合: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.getString('$type')))
      expect(obj.getString('$type')).assertEqual('GridItem')
      console.log('GridItem1‘s rowStart is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowStart')))
      console.log('GridItem1‘s rowEnd is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowEnd')))
      console.log('GridItem1‘s columnStart is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnStart')))
      console.log('GridItem1‘s columnEnd is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnEnd')))
      console.log('GridItem1‘s forceRebuild is ' +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('forceRebuild')))
      await sleep(1)
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowStart')).assertEqual('1')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowEnd')).assertEqual('4')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnStart')).assertEqual('1')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('columnEnd')).assertEqual('2')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('forceRebuild')).assertEqual('false')
      console.info('gridItemTest001_static_01 END');
    });
  })
}
