/*
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


import { afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function datapanelJsunit() {


  describe('dataPanelTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DataPanel',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get DataPanel state success " + JSON.stringify(pages));
        if (!("DataPanel" == pages.name)) {
          console.info("get DataPanel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push DataPanel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DataPanel page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("DataPanel after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0730
     * @tc.name testDataPanelGetInspectorByKey010
     * @tc.desc aceEtsTest
     */
    it('testDataPanelGetInspectorByKey010', Level.LEVEL0, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('DataPanel');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringify(obj));
      console.log("cd DataPanel type " + JSON.stringify(obj.$type));
      console.log("cd DataPanel values1 " + typeof ([20, 40, 20]));
      console.log("cd DataPanel values " + typeof (obj.$attrs.values));
      console.log("cd DataPanel values" + JSON.stringify(obj.$attrs.values));
      console.log("cd DataPanel dataPanelType" + JSON.stringify(obj.$attrs.DataPanelType));
      console.log("cd  DataPanel max" + JSON.stringify(obj.$attrs.max));
      console.log("panel closeEffect" + JSON.stringify(obj.$attrs.closeEffect));
      expect(obj.$attrs.closeEffect).assertEqual("false");
      expect(obj.$type).assertEqual("DataPanel");
      expect(JSON.stringify(obj.$attrs.values)).assertEqual('[20,40,20]')
      expect(obj.$attrs.max).assertEqual(100.000000.toFixed(6));
      console.info('cd dataPanelInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0740
     * @tc.name testDataPanelGetInspectorByKey020
     * @tc.desc aceEtsTest
     */
    it('testDataPanelGetInspectorByKey020', Level.LEVEL0, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('DataPanel2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringify(obj));
      console.log("cd DataPanel dataPanelType" + JSON.stringify(obj.$attrs));
      console.log("cd DataPanel Type" + JSON.stringify(obj.$attrs.type));
      expect(obj.$attrs.type).assertEqual("DataPanelType.Circle");
      console.log("panel closeEffect" + JSON.stringify(obj.$attrs.closeEffect));
      expect(obj.$attrs.closeEffect).assertEqual("true");
      console.info('cd dataPanelInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0740
     * @tc.name testDataPanelGetInspectorByKey020
     * @tc.desc aceEtsTest
     */
    it('testDataPanelGetInspectorByKey030', Level.LEVEL0, async (done: Function) => {
      console.info('testGetInspectorByKey START');
      let strJson = getInspectorByKey('DataPanel3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("cd DatePanel component obj is: " + JSON.stringify(obj));
      console.log("cd DataPanel type " + JSON.stringify(obj.$type));
      console.log("cd DataPanel values1 " + typeof ([20, 40, 20]));
      console.log("cd DataPanel values " + typeof (obj.$attrs.values));
      console.log("cd DataPanel values" + JSON.stringify(obj.$attrs.values));
      console.log("cd  DataPanel max" + JSON.stringify(obj.$attrs.max));
      console.log("panel closeEffect" + JSON.stringify(obj.$attrs.closeEffect))
      expect(obj.$attrs.closeEffect).assertEqual("false");
      expect(obj.$type).assertEqual("DataPanel");
      expect(JSON.stringify(obj.$attrs.values)).assertEqual('[20,40,20]');
      expect(obj.$attrs.max).assertEqual(100.000000.toFixed(6));
      console.info('cd dataPanelInspectorByKey END');
      done();
    });
  })
}
