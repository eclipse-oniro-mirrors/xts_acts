/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import sendableResourceManager from '@ohos.sendableResourceManager';

export default function globalStageTest() {
  describe("globalStageTest", () => {
    console.log('*************start globalStageTest*************');

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_0100
     * @tc.name      : getStringSync with resource object and format value
     * @tc.desc      : getStringSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringSync_stagetest_0100', 0, async (done: Function) => {
      let mgr = globalThis.yq.resourceManager;
      try {
        let value = mgr.getStringSync(
          {
            bundleName: "ohos.acts.globalstage",
            moduleName: "phone",
            id: $r('app.string.app_name').id
          }, 100);
        console.log('getStringSync_stagetest_0100 1' + value);
        expect(value).assertEqual('ohosProject 100');
      } catch (error) {
        console.log('getStringSync_stagetest_0100 3' + error.code);
        expect(error.code == 401).assertTrue();
        console.log('getStringSync_stagetest_0100 3' + error.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_0200
     * @tc.name      : getStringSync with resource object
     * @tc.desc      : getStringSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringSync_stagetest_0200', 0, async (done: Function) => {
      let mgr = globalThis.yq.resourceManager;
      try {
        let value = mgr.getStringSync(
          {
            bundleName: "ohos.acts.globalstage",
            moduleName: "phone",
            id: $r('app.string.app_name').id
          });
        console.log('getStringSync_stagetest_0200 1' + value);
        expect(value).assertEqual('ohosProject %d');
      } catch (error) {
        console.log('getStringSync_stagetest_0200 2' + error.code);
        expect(error.code == 401).assertTrue();
        console.log('getStringSync_stagetest_0200 3' + error.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGBYNAME_STAGE_0100
     * @tc.name      : getStringByNameSync with resource name
     * @tc.desc      : getStringByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getStringByNameSync('app_name');
        console.log('getStringByNameSync_stagetest_0100 1' + value);
        expect(value).assertEqual('ohosProject %d');
      }
      catch (e) {
        console.log('getStringByNameSync_stagetest_0100 2' + e.code);
        console.log('getStringByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGBYNAME_STAGE_0200
     * @tc.name      : getStringByNameSync with resource name and format value
     * @tc.desc      : getStringByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringByNameSync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getStringByNameSync('app_name', 100);
        console.log('getStringByNameSync_stagetest_0200 1' + value);
        expect(value).assertEqual('ohosProject 100');
      }
      catch (e) {
        console.log('getStringByNameSync_stagetest_0200 2' + e.code);
        console.log('getStringByNameSync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGVALUE_STAGE_0100
     * @tc.name      : getStringValue with resource name in callback mode
     * @tc.desc      : getStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringValue_stage_test_0100', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.string.app_name').id
      }, (err: BusinessError, value: string) => {
        expect(value !== null).assertTrue();
        console.log('getStringValue_stage_test_0100 ' + value);
        expect(value).assertEqual('ohosProject %d');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGVALUE_STAGE_0200
     * @tc.name      : getStringValue with resource name in promise mode
     * @tc.desc      : getStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringValue_stage_test_0200', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.string.app_name').id
      }).then((value: string) => {
        expect(value !== null).assertTrue();
        console.log('getStringValue_stage_test_0200 ' + value);
        expect(value).assertEqual('ohosProject %d');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUE_STAGE_0100
     * @tc.name      : getStringArrayValue with resource name in callback mode
     * @tc.desc      : getStringArrayValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayValue_stage_test_0100', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.strarray.sizeList').id
      }, (err: BusinessError, value: Array<string>) => {
        expect(value !== null).assertTrue();
        console.log('getStringArrayValue_stage_test_0100 ' + value);
        expect(value[0]).assertEqual('small');
        expect(value[1]).assertEqual('middle');
        expect(value[2]).assertEqual('large');
        expect(value[3]).assertEqual('extra large');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUE_STAGE_0200
     * @tc.name      : getStringArrayValue with resource name in promise mode
     * @tc.desc      : getStringArrayValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayValue_stage_test_0200', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.strarray.sizeList').id
      }).then((value: Array<string>) => {
        expect(value !== null).assertTrue();
        console.log('getStringArrayValue_stage_test_0200 ' + value);
        expect(value[0]).assertEqual('small');
        expect(value[1]).assertEqual('middle');
        expect(value[2]).assertEqual('large');
        expect(value[3]).assertEqual('extra large');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0100
     * @tc.name      : getMediaContent with resource name in callback mode
     * @tc.desc      : getMediaContent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContent_stage_test_0100', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.media.icon').id
      }, (err: BusinessError, value: Uint8Array) => {
        expect(value.length == 6790).assertTrue();
        console.log('getMediaContent_stage_test_0100 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0200
     * @tc.name      : getMediaContent with resource name in promise mode
     * @tc.desc      : getMediaContent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContent_stage_test_0200', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.media.icon').id
      }).then((value: Uint8Array) => {
        expect(value.length == 6790).assertTrue();
        console.log('getMediaContent_stage_test_0200 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0300
     * @tc.name      : getMediaContent with resource name and density in callback mode
     * @tc.desc      : getMediaContent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContent_stage_test_0300', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.media.icon').id
      }, 0, (err: BusinessError, value: Uint8Array) => {
        expect(value.length == 6790).assertTrue();
        console.log('getMediaContent_stage_test_0300 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0400
     * @tc.name      : getMediaContent with resource name and density in promise mode
     * @tc.desc      : getMediaContent
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContent_stage_test_0400', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.media.icon').id
      }, 0).then((value: Uint8Array) => {
        expect(value.length == 6790).assertTrue();
        console.log('getMediaContent_stage_test_0400 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0100
     * @tc.name      : getMediaContentBase64 with resource name in callback mode
     * @tc.desc      : getMediaContentBase64
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64_stage_test_0100', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.media.icon').id
      }, (err: BusinessError, value: string) => {
        expect(value.length == 9078).assertTrue();
        console.log('getMediaContentBase64_stage_test_0100 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0200
     * @tc.name      : getMediaContentBase64 with resource name in promise mode
     * @tc.desc      : getMediaContentBase64
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64_stage_test_0200', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.media.icon').id
      }).then((value: string) => {
        expect(value.length == 9078).assertTrue();
        console.log('getMediaContentBase64_stage_test_0200 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0300
     * @tc.name      : getMediaContentBase64 with resource name and density in callback mode
     * @tc.desc      : getMediaContentBase64
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64_stage_test_0300', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.media.icon').id
      }, 0, (err: BusinessError, value: string) => {
        expect(value.length == 9078).assertTrue();
        console.log('getMediaContentBase64_stage_test_0300 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0400
     * @tc.name      : getMediaContentBase64 with resource name and density in promise mode
     * @tc.desc      : getMediaContentBase64
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64_stage_test_0400', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.media.icon').id
      }, 0).then((value: string) => {
        expect(value.length == 9078).assertTrue();
        console.log('getMediaContentBase64_stage_test_0400 ' + value.length);
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUE_STAGE_0100
     * @tc.name      : getPluralStringValue with resource name in callback mode
     * @tc.desc      : getPluralStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringValue_stage_test_0100', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.plural.plural_name').id
      }, 2, (error: BusinessError, value: string) => {
        expect(value !== null).assertTrue();
        console.log('getPluralStringValue_stage_test_0100 ' + value);
        expect(value).assertEqual('2 apples');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUE_STAGE_0200
     * @tc.name      : getPluralStringValue with resource name in promise mode
     * @tc.desc      : getPluralStringValue
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringValue_stage_test_0200', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.plural.plural_name').id
      }, 2).then((value: string) => {
        expect(value !== null).assertTrue();
        console.log('getPluralStringValue_stage_test_0200 ' + value);
        expect(value).assertEqual('2 apples');
        done();
      })
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETBOOLEAN_STAGE_0100
     * @tc.name      : getBoolean with resource name
     * @tc.desc      : getBoolean
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getBoolean_stage_test_0100', 0, async (done: Function) => {
      let value = globalThis.yq.resourceManager.getBoolean({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.boolean.boolean_1').id
      });
      console.log('getBoolean_stage_test_0100 ' + value);
      expect(value).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETNUMBER_STAGE_0100
     * @tc.name      : getNumber with resource name
     * @tc.desc      : getNumber
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNumber_stage_test_0100', 0, async (done: Function) => {
      let value = globalThis.yq.resourceManager.getNumber({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.integer.integer_1').id
      });
      console.log('getinteger_stage_test_0100 ' + value);
      expect(value).assertEqual(100);
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETDRAWABLEDESCRIPTOR_STAGE_0100
     * @tc.name      : getDrawableDescriptor with resource name
     * @tc.desc      : getDrawableDescriptor
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getDrawableDescriptor_stage_test_0100', 0, async (done: Function) => {
      let out = true;
      let value = globalThis.yq.resourceManager.getDrawableDescriptor(
        {
          bundleName: "ohos.acts.globalstage", moduleName: "phone", id: $r('app.media.icon').id
        });
      console.log('getDrawableDescriptor_stage_test_0100 ' + value);
      if (value == null) {
        out = false;
      }
      console.log('getDrawableDescriptor_test_2100 ' + out);
      expect(out).assertTrue();
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_GETCOLOR_STAGE_JS_0100
    * @tc.name    test getColor method with resource param in callback mode
    * @tc.desc    get the color in callback mode
    */
    it('getColor_test_0100', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getColor({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.color.color_test1').id
      }, (err: BusinessError, value: number) => {
        expect(value !== null).assertTrue();
        console.log('getColor_test_0100 ' + value);
        expect(value).assertEqual(4294967295);
        done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_GETCOLOR_STAGE_JS_0200
    * @tc.name    test getColor method with resource param in promise mode
    * @tc.desc    get the color in promise mode
    */
    it('getColor_test_0200', 0, async (done: Function) => {
      globalThis.yq.resourceManager.getColor({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.color.color_test1').id
      }).then((value: number) => {
        expect(value !== null).assertTrue();
        console.log('getColor_test_0200 ' + value);
        expect(value).assertEqual(4294967295);
        done();
      })
    })

    /* *
    * @tc.number  SUB_GLOBAL_GETCOLORSYNC_STAGE_JS_0100
    * @tc.name    test getColorSync method with resource param in promise mode
    * @tc.desc    get the sync color in promise mode
    */
    it('getColorSync_test_0100', 0, async (done: Function) => {
      let value = globalThis.yq.resourceManager.getColorSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "phone",
        id: $r('app.color.color_test1').id
      });
      expect(value !== null).assertTrue();
      console.log('getColorSync_test_0100 ' + value);
      expect(value).assertEqual(4294967295);
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETRAWFDSYNC_STAGE_0100
     * @tc.name      : getRawFdSync with path
     * @tc.desc      : getRawFdSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getRawFdSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getRawFdSync('rawfiletest.xml');
        console.log('getRawFdSync_stagetest_0100 1' + value.fd);
        console.log('getRawFdSync_stagetest_0100 1' + value.offset);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getRawFdSync_stagetest_0100 2' + e.code);
        console.log('getRawFdSync_stagetest_0100 3' + e.message);
      }
      globalThis.yq.resourceManager.closeRawFdSync('rawfiletest.xml');
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETRAWFILELISTSYNC_STAGE_0100
     * @tc.name      : getRawFileListSync with path
     * @tc.desc      : getRawFileListSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getRawFileListSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getRawFileListSync('');
        console.log('getRawFileListSync_stagetest_0100 1' + value);
        console.log('getRawFileListSync_stagetest_0100 1' + value.length);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getRawFileListSync_stagetest_0100 2' + e.code);
        console.log('getRawFileListSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETRAWFILECONTENTSYNC_STAGE_0100
     * @tc.name      : getRawFileContentSync with path
     * @tc.desc      : getRawFileContentSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getRawFileContentSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getRawFileContentSync('rawfiletest.xml');
        console.log('getRawFileContentSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getRawFileContentSync_stagetest_0100 2' + e.code);
        console.log('getRawFileContentSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTSYNC_STAGE_0100
     * @tc.name      : getMediaContentSync with res id
     * @tc.desc      : getMediaContentSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getMediaContentSync($r('app.media.icon').id);
        console.log('getMediaContentSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getMediaContentSync_stagetest_0100 2' + e.code);
        console.log('getMediaContentSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTSYNC_STAGE_0200
     * @tc.name      : getMediaContentSync with resource object
     * @tc.desc      : getMediaContentSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentSync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getMediaContentSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "phone",
          id: $r('app.media.icon').id
        });
        console.log('getMediaContentSync_stagetest_0200 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getMediaContentSync_stagetest_0200 2' + e.code);
        console.log('getMediaContentSync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64SYNC_STAGE_0100
     * @tc.name      : getMediaContentBase64Sync with res id
     * @tc.desc      : getMediaContentBase64Sync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64Sync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getMediaContentBase64Sync($r('app.media.icon').id);
        console.log('getMediaContentBase64Sync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getMediaContentBase64Sync_stagetest_0100 2' + e.code);
        console.log('getMediaContentBase64Sync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64SYNC_STAGE_0200
     * @tc.name      : getMediaContentBase64Sync with resource object
     * @tc.desc      : getMediaContentBase64Sync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentBase64Sync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getMediaContentBase64Sync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "phone",
          id: $r('app.media.icon').id
        });
        console.log('getMediaContentBase64Sync_stagetest_0200 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getMediaContentBase64Sync_stagetest_0200 2' + e.code);
        console.log('getMediaContentBase64Sync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUESYNC_STAGE_0100
     * @tc.name      : getPluralStringValueSync with res id
     * @tc.desc      : getPluralStringValueSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringValueSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getPluralStringValueSync($r('app.plural.plural_name').id, 0);
        console.log('getPluralStringValueSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getPluralStringValueSync_stagetest_0100 2' + e.code);
        console.log('getPluralStringValueSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUESYNC_STAGE_0200
     * @tc.name      : getPluralStringValueSync with resource object
     * @tc.desc      : getPluralStringValueSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringValueSync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "phone",
          id: $r('app.plural.plural_name').id
        });
        console.log('getPluralStringValueSync_stagetest_0200 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getPluralStringValueSync_stagetest_0200 2' + e.code);
        console.log('getPluralStringValueSync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUESYNC_STAGE_0100
     * @tc.name      : getStringArrayValueSync with res id
     * @tc.desc      : getStringArrayValueSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayValueSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getStringArrayValueSync($r('app.strarray.sizeList').id);
        console.log('getStringArrayValueSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getStringArrayValueSync_stagetest_0100 2' + e.code);
        console.log('getStringArrayValueSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUESYNC_STAGE_0200
     * @tc.name      : getStringArrayValueSync with resource object
     * @tc.desc      : getStringArrayValueSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayValueSync_stagetest_0200', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getStringArrayValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "phone",
          id: $r('app.strarray.sizeList').id
        });
        console.log('getStringArrayValueSync_stagetest_0200 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getStringArrayValueSync_stagetest_0200 2' + e.code);
        console.log('getStringArrayValueSync_stagetest_0200 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGBYNAMESYNC_STAGE_0100
     * @tc.name      : getPluralStringByNameSync with resource name
     * @tc.desc      : getPluralStringByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPluralStringByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getPluralStringByNameSync('plural_name', 2);
        console.log('getPluralStringByNameSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getPluralStringByNameSync_stagetest_0100 2' + e.code);
        console.log('getPluralStringByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIABYNAMESYNC_STAGE_0100
     * @tc.name      : getMediaByNameSync with resource name
     * @tc.desc      : getMediaByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getMediaByNameSync('icon');
        console.log('getMediaByNameSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getMediaByNameSync_stagetest_0100 2' + e.code);
        console.log('getMediaByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETMEDIABASE64BYNAMESYNC_STAGE_0100
     * @tc.name      : getMediaBase64ByNameSync with resource name
     * @tc.desc      : getMediaBase64ByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaBase64ByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getMediaBase64ByNameSync('icon');
        console.log('getMediaBase64ByNameSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getMediaBase64ByNameSync_stagetest_0100 2' + e.code);
        console.log('getMediaBase64ByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYBYNAMESYNC_STAGE_0100
     * @tc.name      : getStringArrayByNameSync with resource name
     * @tc.desc      : getStringArrayByNameSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringArrayByNameSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getStringArrayByNameSync('sizeList');
        console.log('getStringArrayByNameSync_stagetest_0100 1' + value);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getStringArrayByNameSync_stagetest_0100 2' + e.code);
        console.log('getStringArrayByNameSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETCONFIGURATIONSYNC_STAGE_0100
     * @tc.name      : getConfigurationSync
     * @tc.desc      : getConfigurationSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getConfigurationSync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getConfigurationSync();
        console.log('getStringArrayByNameSync_stagetest_0100 1' + value.locale);
        console.log('getStringArrayByNameSync_stagetest_0100 1' + value.direction);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getConfigurationSync_stagetest_0100 2' + e.code);
        console.log('getConfigurationSync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GETDEVICECAPABILITYSYNC_STAGE_0100
     * @tc.name      : getDeviceCapabilitySync
     * @tc.desc      : getDeviceCapabilitySync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getDeviceCapabilitySync_stagetest_0100', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getDeviceCapabilitySync();
        console.log('getDeviceCapabilitySync_stagetest_0100 1' + value.screenDensity);
        console.log('getDeviceCapabilitySync_stagetest_0100 1' + value.deviceType);
        expect(value !== null).assertTrue();
      }
      catch (e) {
        console.log('getDeviceCapabilitySync_stagetest_0100 2' + e.code);
        console.log('getDeviceCapabilitySync_stagetest_0100 3' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_GetLocales_0010
     * @tc.name      : getLocales without parameter
     * @tc.desc      : getLocales
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_GetLocales_0010', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getLocales();
        console.log('SUB_GLOBAL_GetLocales_0010' + value);
        expect(value == 'en-US,zh-CN').assertTrue();
      } catch (e) {
        console.log('SUB_GLOBAL_GetLocales_0010_errorCode' + e.code);
        console.log('SUB_GLOBAL_GetLocales_0010_errorMessage' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0010
     * @tc.name      : getSymbol resource not found by resid
     * @tc.desc      : getSymbol
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_GetSymbol_0010', 0, async (done) => {
      try {
        let value = globalThis.yq.resourceManager.getSymbol(0x02000006);
        console.log('SUB_GLOBAL_Getsymbol_0010_value' + value);
        expect(value == '983043').assertTrue();
      } catch (e) {
        console.log('SUB_GLOBAL_GetSymbol_0010_errorCode' + e.code);
        console.log('SUB_GLOBAL_GetSymbol_0010_errorMessage' + e.message);
      }
      done();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0130
     * @tc.name      : getSymbolByName normal name
     * @tc.desc      : getSymbolByName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_GLOBAL_GetSymbol_0130', 0, async (done: Function) => {
      try {
        let value = globalThis.yq.resourceManager.getSymbolByName('symbolTest1');
        console.log('SUB_GLOBAL_Getsymbol_0130' + value);
        expect(value == 983043).assertTrue();
      } catch (e) {
        console.log('SUB_GLOBAL_GetSymbol_0130_errorCode' + e.code);
        console.log('SUB_GLOBAL_GetSymbol_0130_errorMessage' + e.message);
      }
      done();
    })

    it('SUB_GOLBAL_REMSGR_isRawDir_0010',0,async ()=>{
      try {
        let value = globalThis.yq.resourceManager.isRawDir('rawfiletest.xml');
        console.log('SUB_GOLBAL_REMSGR_isRawDir_0010_value'+value);
        expect(value==false).assertTrue();
      }catch (e){
        console.log('SUB_GOLBAL_REMSGR_isRawDir_0010_errorCode'+e.code);
        console.log('SUB_GOLBAL_REMSGR_isRawDir_0010_errorMessage'+e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010',0,async ()=>{
      try {
        let value = globalThis.yq.resourceManager.getOverrideConfiguration();
        console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010_value'+value.mnc);
        expect(value.mnc==0).assertTrue();
      }catch (e){
        console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010_errorCode'+e.code);
        console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010_errorMessage'+e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010',0,async ()=>{
      try {
        let completeOverrideConfiguration:resourceManager.Configuration= {
          mcc : 460,
          mnc : 101,
          locale : 'en-US',
          direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
          deviceType:resourceManager.DeviceType.DEVICE_TYPE_PHONE,
          colorMode:1,
          screenDensity:resourceManager.ScreenDensity.SCREEN_SDPI
        }
        let value = globalThis.yq.resourceManager.getOverrideResourceManager(completeOverrideConfiguration);
        console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010_value'+value.getOverrideConfiguration().mcc);
        expect(value.getOverrideConfiguration().mcc==460).assertTrue();
      }catch (e){
        console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010_errorCode'+e.code);
        console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010_errorMessage'+e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010',0,async ()=>{
      try {
        let completeOverrideConfiguration:resourceManager.Configuration= {
          mcc : 460,
          mnc : 101,
          locale : 'en-US',
          direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
          deviceType:resourceManager.DeviceType.DEVICE_TYPE_PHONE,
          colorMode:1,
          screenDensity:resourceManager.ScreenDensity.SCREEN_SDPI
        }
        let value = globalThis.yq.resourceManager.getOverrideResourceManager();
        console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_value-before'+value.getOverrideConfiguration().mcc);
        expect(value.getOverrideConfiguration().mcc==0).assertTrue();
        value.updateOverrideConfiguration(completeOverrideConfiguration);
        console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_value-after'+value.getOverrideConfiguration().mcc);
        expect(value.getOverrideConfiguration().mcc==460).assertTrue();
      }catch (e){
        console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_errorCode'+e.code);
        console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_errorMessage'+e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010',0,async ()=>{
      try {
        let resource:resourceManager.Resource= {
          bundleName: 'com.example.myapplication',
          moduleName: 'entry',
          id: $r('app.string.module_desc').id,
          params:["sdfd",123],
          type:10001,
        }
        let value = sendableResourceManager.resourceToSendableResource(resource);
        console.log('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010_value'+value.type);
        expect(value.type==10001).assertTrue();
      }catch (e){
        console.log('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010_errorCode'+e.code);
        console.log('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010_errorMessage'+e.message);
      }
    })

    it('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010',0,async ()=>{
      try {
        let resource:resourceManager.Resource= {
          bundleName: 'com.example.myapplication',
          moduleName: 'entry',
          id: $r('app.string.module_desc').id,
          params:["sdfd",123],
          type:10001,
        }
        let sendableresource= sendableResourceManager.resourceToSendableResource(resource);
        let value = sendableResourceManager.sendableResourceToResource(sendableresource);
        value.type=10002
        console.log('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010_value'+value.type);
        expect(value.type==10002).assertTrue();
      }catch (e){
        console.log('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010_errorCode'+e.code);
        console.log('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010_errorMessage'+e.message);
      }
    })

    console.log('*************end globalStageTest*************');
  })
}