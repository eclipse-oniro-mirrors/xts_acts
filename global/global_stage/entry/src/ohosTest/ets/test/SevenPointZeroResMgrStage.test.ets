/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import resourceManager from '@ohos.resourceManager';
import {
  describe,
  it,
  expect,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import { GlobalContext } from '../test/global';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function SevenPointZeroResMgrStageTest() {

  describe("SevenPointZeroResMgrStageTest", (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', '*************start SevenPointZeroResMgrStageTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      resContext = (GlobalContext.getContext().getObject('yq') as Context)
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0100
     * @tc.name    getResourceName_test_0100
     * @tc.desc    app string resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("getResourceName_test_0100", Level.LEVEL0, () => {
      try {
        let resName: string = res.getResourceName($r('app.string.test_stringOne').id);
        hilog.info(domain, tag, 'getResourceName_test_0100 value: ' + resName);
        expect(resName).assertEqual('test_stringOne');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0100 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0200
     * @tc.name    getResourceName_test_0200
     * @tc.desc    app media resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_0200", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('app.media.icon').id);
        hilog.info(domain, tag, 'getResourceName_test_0200 value: ' + resName);
        expect(resName).assertEqual('icon');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0200 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0400
     * @tc.name    getResourceName_test_0300
     * @tc.desc    app color resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_0300", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('app.color.color_test1').id);
        hilog.info(domain, tag, 'getResourceName_test_0300 value: ' + resName);
        expect(resName).assertEqual('color_test1');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0300 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0500
     * @tc.name    getResourceName_test_0400
     * @tc.desc    app float resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_0400", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('app.float.float_loopA').id);
        hilog.info(domain, tag, 'getResourceName_test_0400 value: ' + resName);
        expect(resName).assertEqual('float_loopA');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0400 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0800
     * @tc.name    getResourceName_test_0500
     * @tc.desc    app strarray resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_0500", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('app.strarray.sizeList').id);
        hilog.info(domain, tag, 'getResourceName_test_0500 value: ' + resName);
        expect(resName).assertEqual('sizeList');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0500 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0300
     * @tc.name    getResourceName_test_0600
     * @tc.desc    app boolean resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_0600", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('app.boolean.boolean_1').id);
        hilog.info(domain, tag, 'getResourceName_test_0600 value: ' + resName);
        expect(resName).assertEqual('boolean_1');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0600 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0600
     * @tc.name    getResourceName_test_0700
     * @tc.desc    app integer resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_0700", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('app.integer.integer_1').id);
        hilog.info(domain, tag, 'getResourceName_test_0700 value: ' + resName);
        expect(resName).assertEqual('integer_1');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0700 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0700
     * @tc.name    getResourceName_test_0800
     * @tc.desc    app plural resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_0800", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('app.plural.plural_name').id);
        hilog.info(domain, tag, 'getResourceName_test_0800 value: ' + resName);
        expect(resName).assertEqual('plural_name');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0800 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_0900
     * @tc.name    getResourceName_test_0900
     * @tc.desc    app symbol resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_0900", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('app.symbol.symbolTest1').id);
        hilog.info(domain, tag, 'getResourceName_test_0900 value: ' + resName);
        expect(resName).assertEqual('symbolTest1');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_0900 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_1200
     * @tc.name    getResourceName_test_1000
     * @tc.desc    system string resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_1000", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('sys.string.ohos_id_text_font_family_regular').id);
        hilog.info(domain, tag, 'getResourceName_test_1000 value: ' + resName);
        expect(resName).assertEqual('ohos_id_text_font_family_regular');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_1000 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_1500
     * @tc.name    getResourceName_test_1100
     * @tc.desc    system media resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_1100", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('sys.media.ohos_app_icon').id);
        hilog.info(domain, tag, 'getResourceName_test_1100 value: ' + resName);
        expect(resName).assertEqual('ohos_app_icon');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_1100 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_1400
     * @tc.name    getResourceName_test_1200
     * @tc.desc    system color resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_1200", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('sys.color.ohos_id_color_foreground').id);
        hilog.info(domain, tag, 'getResourceName_test_1200 value: ' + resName);
        expect(resName).assertEqual('ohos_id_color_foreground');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_1200 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_1300
     * @tc.name    getResourceName_test_1300
     * @tc.desc    system float resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_1300", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('sys.float.ohos_id_alpha_content_primary').id);
        hilog.info(domain, tag, 'getResourceName_test_1300 value: ' + resName);
        expect(resName).assertEqual('ohos_id_alpha_content_primary');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_1300 error code: ' + error.code);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_1700
     * @tc.name    getResourceName_test_1800
     * @tc.desc    null parameter
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("getResourceName_test_1800", Level.LEVEL3, () => {
      try {
        let resName: string = res.getResourceName(null);
        hilog.info(domain, tag, 'getResourceName_test_1800 value: ' + resName);
        expect().assertFail();
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_1800 error code: ' + error.code);
        expect(error.code).assertEqual(401);
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_1800
     * @tc.name    getResourceName_test_1900
     * @tc.desc    undefined parameter
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("getResourceName_test_1900", Level.LEVEL3, () => {
      try {
        let resName: string = res.getResourceName(undefined);
        hilog.info(domain, tag, 'getResourceName_test_1900 value: ' + resName);
        expect().assertFail();
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_1900 error code: ' + error.code);
        expect(error.code).assertEqual(401);
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_1900
     * @tc.name    getResourceName_test_2000
     * @tc.desc    invalid resource id
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it("getResourceName_test_2000", Level.LEVEL3, () => {
      try {
        let resName: string = res.getResourceName(0x01234567);
        hilog.info(domain, tag, 'getResourceName_test_2000 value: ' + resName);
        expect().assertFail();
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_2000 error code: ' + error.code);
        expect(error.code).assertEqual(9001001);
      }
    })

    /**
     * @tc.number  SUB_GLOBAL_ResourceManager_GetResourceName_1600
     * @tc.name    getResourceName_test_2100
     * @tc.desc    system overlay color resource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it("getResourceName_test_2100", Level.LEVEL2, () => {
      try {
        let resName: string = res.getResourceName($r('sys.color.multi_color_01').id);
        hilog.info(domain, tag, 'getResourceName_test_2100 value: ' + resName);
        expect(resName).assertEqual('multi_color_01');
      } catch (error) {
        hilog.info(domain, tag, 'getResourceName_test_2100 error code: ' + error.code);
        expect().assertFail();
      }
    })

    console.log('*************end SevenPointZeroResMgrStageTest*************');
  })
}