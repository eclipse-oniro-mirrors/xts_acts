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

import resourceManager from '@ohos.resourceManager';
import Ability from '@ohos.app.ability.UIAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import sendableResourceManager from '@ohos.sendableResourceManager';
import { GlobalContext } from '../test/global';

export default function globalStageTest() {
  describe("globalStageTest", () => {
    console.log('*************start globalStageTest*************');
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
     * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_0100
     * @tc.name      : getStringSync with resource object and format value
     * @tc.desc      : getStringSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getStringSync_stagetest_0100', 0, async (done: Function) => {
      let mgr: resourceManager.ResourceManager = res;
      try {
        let value: string = mgr.getStringSync(
          {
            bundleName: "ohos.acts.globalstage",
            moduleName: "entry_test",
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
      let mgr: resourceManager.ResourceManager = res;
      try {
        let value: string = mgr.getStringSync(
          {
            bundleName: "ohos.acts.globalstage",
            moduleName: "entry_test",
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
      let value: string = res.getStringByNameSync('app_name');
      console.log('getStringByNameSync_stagetest_0100 1' + value);
      expect(value).assertEqual('ohosProject %d');
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
      let value: string = res.getStringByNameSync('app_name', 100);
      console.log('getStringByNameSync_stagetest_0200 1' + value);
      expect(value).assertEqual('ohosProject 100');
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
      res.getStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      let value: boolean = res.getBoolean({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      let value: number = res.getNumber({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      let value: DrawableDescriptor = res.getDrawableDescriptor(
        {
          bundleName: "ohos.acts.globalstage", moduleName: "entry_test", id: $r('app.media.icon').id
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
      res.getColor({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      res.getColor({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      let value: number = res.getColorSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
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
      let value: resourceManager.RawFileDescriptor = res.getRawFdSync('rawfiletest.xml');
      console.log('getRawFdSync_stagetest_0100 1' + value.fd);
      console.log('getRawFdSync_stagetest_0100 1' + value.offset);
      expect(value !== null).assertTrue();
      res.closeRawFdSync('rawfiletest.xml');
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
      let value: Array<string> = res.getRawFileListSync('');
      console.log('getRawFileListSync_stagetest_0100 1' + value);
      console.log('getRawFileListSync_stagetest_0100 1' + value.length);
      expect(value !== null).assertTrue();
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
      let value: Uint8Array =
      res.getRawFileContentSync('rawfiletest.xml');
      console.log('getRawFileContentSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: Uint8Array = res.getMediaContentSync($r('app.media.icon').id);
      console.log('getMediaContentSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: Uint8Array = res.getMediaContentSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      });
      console.log('getMediaContentSync_stagetest_0200 1' + value);
      expect(value !== null).assertTrue();
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
      let value: string = res.getMediaContentBase64Sync($r('app.media.icon').id);
      console.log('getMediaContentBase64Sync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: string = res.getMediaContentBase64Sync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      });
      console.log('getMediaContentBase64Sync_stagetest_0200 1' + value);
      expect(value !== null).assertTrue();
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
      let value: string = res.getPluralStringValueSync($r('app.plural.plural_name').id, 0);
      console.log('getPluralStringValueSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: string = res.getPluralStringValueSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.plural.plural_name').id
      }, 1);
      console.log('getPluralStringValueSync_stagetest_0200 1' + value);
      expect(value !== null).assertTrue();
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
      let value: Array<string> =
      res.getStringArrayValueSync($r('app.strarray.sizeList').id);
      console.log('getStringArrayValueSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: Array<string> = res.getStringArrayValueSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.strarray.sizeList').id
      });
      console.log('getStringArrayValueSync_stagetest_0200 1' + value);
      expect(value !== null).assertTrue();
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
      let value: string = res.getPluralStringByNameSync('plural_name', 2);
      console.log('getPluralStringByNameSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: Uint8Array = res.getMediaByNameSync('icon');
      console.log('getMediaByNameSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: string = res.getMediaBase64ByNameSync('icon');
      console.log('getMediaBase64ByNameSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: Array<string> = res.getStringArrayByNameSync('sizeList');
      console.log('getStringArrayByNameSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
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
      let value: resourceManager.Configuration = res.getConfigurationSync();
      console.log('getStringArrayByNameSync_stagetest_0100 1' + value.locale);
      console.log('getStringArrayByNameSync_stagetest_0100 1' + value.direction);
      expect(value !== null).assertTrue();
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
      let value: resourceManager.DeviceCapability = res.getDeviceCapabilitySync();
      console.log('getDeviceCapabilitySync_stagetest_0100 1' + value.screenDensity);
      console.log('getDeviceCapabilitySync_stagetest_0100 1' + value.deviceType);
      expect(value !== null).assertTrue();
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
      let value: string = res.getLocales().toString();
      console.log('SUB_GLOBAL_GetLocales_0010' + value);
      expect(value == 'en-US,zh-CN').assertTrue();
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
    it('SUB_GLOBAL_GetSymbol_0010', 0, async (done: Function) => {
      let value: number = res.getSymbol($r('app.symbol.symbolTest1').id);
      console.log('SUB_GLOBAL_Getsymbol_0010_value' + value);
      expect(value == 983043).assertTrue();
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
      let value: number = res.getSymbolByName('symbolTest1');
      console.log('SUB_GLOBAL_Getsymbol_0130' + value);
      expect(value == 983043).assertTrue();
      done();
    })

    it('SUB_GOLBAL_REMSGR_isRawDir_0010', 0, async () => {
      let value: boolean = res.isRawDir('rawfiletest.xml');
      console.log('SUB_GOLBAL_REMSGR_isRawDir_0010_value' + value);
      expect(value == false).assertTrue();
    })

    it('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010', 0, async () => {
      let value: resourceManager.Configuration = res.getOverrideConfiguration();
      console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010_value' + value.mnc);
      expect(value.mnc == 0).assertTrue();
    })

    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010', 0, async () => {
      let completeOverrideConfiguration: resourceManager.Configuration = {
        mcc: 460,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_PHONE,
        colorMode: resourceManager.ColorMode.LIGHT,
        screenDensity: resourceManager.ScreenDensity.SCREEN_SDPI
      }

      let value =
      res.getOverrideResourceManager(completeOverrideConfiguration);
      console.log('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010_value' + value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc == 460).assertTrue();
    })

    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010', 0, async () => {
      let completeOverrideConfiguration: resourceManager.Configuration = {
        mcc: 461,
        mnc: 101,
        locale: 'en-US',
        direction: resourceManager.Direction.DIRECTION_HORIZONTAL,
        deviceType: resourceManager.DeviceType.DEVICE_TYPE_PHONE,
        colorMode: resourceManager.ColorMode.DARK,
        screenDensity: resourceManager.ScreenDensity.SCREEN_SDPI
      }

      let value = res.getOverrideResourceManager();
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_value-before' +
      value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc != 461).assertTrue();
      value.updateOverrideConfiguration(completeOverrideConfiguration);
      console.log('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010_value-after' +
      value.getOverrideConfiguration().mcc);
      expect(value.getOverrideConfiguration().mcc == 461).assertTrue();
    })

    it('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010', 0, async () => {
      let resource: resourceManager.Resource = {
        bundleName: 'com.example.myapplication',
        moduleName: 'entry',
        id: $r('app.string.module_desc').id,
        params: ["sdfd", 123],
        type: 10001,
      }
      let value = sendableResourceManager.resourceToSendableResource(resource);
      console.log('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010_value' + value.type);
      expect(value.bundleName == 'com.example.myapplication').assertTrue();
      expect(value.moduleName == 'entry').assertTrue();
      expect(value.id != null).assertTrue();
      expect(value.params != null).assertTrue();
      expect(value.type == 10001).assertTrue();
    })

    it('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010', 0, async () => {
      let resource: resourceManager.Resource = {
        bundleName: 'com.example.myapplication',
        moduleName: 'entry',
        id: $r('app.string.module_desc').id,
        params: ["sdfd", 123],
        type: 10001,
      }
      let sendableresource = sendableResourceManager.resourceToSendableResource(resource);
      let value = sendableResourceManager.sendableResourceToResource(sendableresource);
      value.type = 10002
      console.log('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010_value' + value.type);
      expect(value.type == 10002).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0100
     * @tc.name      : resourceManager_test_getStringSync_0010
     * @tc.desc      : %2$d(The second parameter is an integer)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0010', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringOne').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringOne').id, "format string", 10, "TestTest");
      console.log('resourceManager_test_getStringSync_0010 value_one:' + value_one);
      expect(value_one).assertEqual('10 TestTest');
      let value_two = resMgr.getStringSync(resource, "format string", 10, "TestTest");
      console.log('resourceManager_test_getStringSync_0010 value_two:' + value_two);
      expect(value_two).assertEqual('10 TestTest');
      let value_three = resMgr.getStringByNameSync('test_stringOne', "format string", 10, "TestTest");
      console.log('resourceManager_test_getStringSync_0010 value_three:' + value_three);
      expect(value_three).assertEqual('10 TestTest');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0200
     * @tc.name      : resourceManager_test_getStringSync_0020
     * @tc.desc      : %2$d(The second parameter is an integer in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0020', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwo').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringTwo').id, "format string", 1.234568E+16);
      console.log('resourceManager_test_getStringSync_0020 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000');
      let value_two = resMgr.getStringSync(resource, "format string", 1.234568E+16);
      console.log('resourceManager_test_getStringSync_0020 value_two:' + value_two);
      expect(value_two).assertEqual('12345680000000000');
      let value_three = resMgr.getStringByNameSync('test_stringTwo', "format string", 1.234568E+16);
      console.log('resourceManager_test_getStringSync_0020 value_three:' + value_three);
      expect(value_three).assertEqual('12345680000000000');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0300
     * @tc.name      : resourceManager_test_getStringSync_0030
     * @tc.desc      : %2$d(The second parameter is a decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0030', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringThree').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringThree').id, "format string", 10.01);
      console.log('resourceManager_test_getStringSync_0030 value_one:' + value_one);
      expect(value_one).assertEqual('10');
      let value_two = resMgr.getStringSync(resource, "format string", 10.01);
      console.log('resourceManager_test_getStringSync_0030 value_two:' + value_two);
      expect(value_two).assertEqual('10');
      let value_three = resMgr.getStringByNameSync('test_stringThree', "format string", 10.01);
      console.log('resourceManager_test_getStringSync_0030 value_three:' + value_three);
      expect(value_three).assertEqual('10');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0400
     * @tc.name      : resourceManager_test_getStringSync_0040
     * @tc.desc      : %2$d(The second parameter is a decimal number in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0040', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringFour').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringFour').id, "format string", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0040 value_one:' + value_one);
      expect(value_one).assertEqual('0');
      let value_two = resMgr.getStringSync(resource, "format string", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0040 value_two:' + value_two);
      expect(value_two).assertEqual('0');
      let value_three = resMgr.getStringByNameSync('test_stringFour', "format string", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0040 value_three:' + value_three);
      expect(value_three).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0500
     * @tc.name      : resourceManager_test_getStringSync_0050
     * @tc.desc      : %3$s(The third parameter is a Chinese string)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0050', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringFive').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringFive').id, "format string", 12, "测试测试");
      console.log('resourceManager_test_getStringSync_0050 value_one:' + value_one);
      expect(value_one).assertEqual('测试测试');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "测试测试");
      console.log('resourceManager_test_getStringSync_0050 value_two:' + value_two);
      expect(value_two).assertEqual('测试测试');
      let value_three = resMgr.getStringByNameSync('test_stringFive', "format string", 12, "测试测试");
      console.log('resourceManager_test_getStringSync_0050 value_three:' + value_three);
      expect(value_three).assertEqual('测试测试');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0600
     * @tc.name      : resourceManager_test_getStringSync_0060
     * @tc.desc      : %3$s(The third parameter is an English string)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0060', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringSix').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringSix').id, "format string", 12, "TestTest");
      console.log('resourceManager_test_getStringSync_0060 value_one:' + value_one);
      expect(value_one).assertEqual('TestTest');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest");
      console.log('resourceManager_test_getStringSync_0060 value_two:' + value_two);
      expect(value_two).assertEqual('TestTest');
      let value_three = resMgr.getStringByNameSync('test_stringSix', "format string", 12, "TestTest");
      console.log('resourceManager_test_getStringSync_0060 value_three:' + value_three);
      expect(value_three).assertEqual('TestTest');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0700
     * @tc.name      : resourceManager_test_getStringSync_0070
     * @tc.desc      : %4$f(The fourth parameter is an integer)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0070', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringSeven').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringSeven').id, "format string", 12, "TestTest", 20);
      console.log('resourceManager_test_getStringSync_0070 value_one:' + value_one);
      expect(value_one).assertEqual('20');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 20);
      console.log('resourceManager_test_getStringSync_0070 value_two:' + value_two);
      expect(value_two).assertEqual('20');
      let value_three = resMgr.getStringByNameSync('test_stringSeven', "format string", 12, "TestTest", 20);
      console.log('resourceManager_test_getStringSync_0070 value_three:' + value_three);
      expect(value_three).assertEqual('20');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0800
     * @tc.name      : resourceManager_test_getStringSync_0080
     * @tc.desc      : %4$f(The fourth parameter is an integer in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0080', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringEight').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringEight')
        .id, "format string", 12, "TestTest", 1.234568E+16);
      console.log('resourceManager_test_getStringSync_0080 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568E+16);
      console.log('resourceManager_test_getStringSync_0080 value_two:' + value_two);
      expect(value_two).assertEqual('12345680000000000');
      let value_three = resMgr.getStringByNameSync('test_stringEight', "format string", 12, "TestTest", 1.234568E+16);
      console.log('resourceManager_test_getStringSync_0080 value_three:' + value_three);
      expect(value_three).assertEqual('12345680000000000');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_0900
     * @tc.name      : resourceManager_test_getStringSync_0090
     * @tc.desc      : %4$f(The fourth parameter is a decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0090', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringNine').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringNine')
        .id, "format string", 12, "TestTest", 20.01);
      console.log('resourceManager_test_getStringSync_0090 value_one:' + value_one);
      expect(value_one).assertEqual('20.01');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 20.01);
      console.log('resourceManager_test_getStringSync_0090 value_two:' + value_two);
      expect(value_two).assertEqual('20.01');
      let value_three = resMgr.getStringByNameSync('test_stringNine', "format string", 12, "TestTest", 20.01);
      console.log('resourceManager_test_getStringSync_0090 value_three:' + value_three);
      expect(value_three).assertEqual('20.01');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1000
     * @tc.name      : resourceManager_test_getStringSync_0100
     * @tc.desc      : %4$f(The fourth parameter is a decimal number in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0100', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTen').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringTen')
        .id, "format string", 12, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0100 value_one:' + value_one);
      expect(value_one).assertEqual('0');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0100 value_two:' + value_two);
      expect(value_two).assertEqual('0');
      let value_three = resMgr.getStringByNameSync('test_stringTen', "format string", 12, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0100 value_three:' + value_three);
      expect(value_three).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1100
     * @tc.name      : resourceManager_test_getStringSync_0110
     * @tc.desc      : %%d
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0110', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringEleven').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringEleven').id, 12);
      console.log('resourceManager_test_getStringSync_0110 value_one:' + value_one);
      expect(value_one).assertEqual('%d');
      let value_two = resMgr.getStringSync(resource, 12);
      console.log('resourceManager_test_getStringSync_0110 value_two:' + value_two);
      expect(value_two).assertEqual('%d');
      let value_three = resMgr.getStringByNameSync('test_stringEleven', 12);
      console.log('resourceManager_test_getStringSync_0110 value_three:' + value_three);
      expect(value_three).assertEqual('%d');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1200
     * @tc.name      : resourceManager_test_getStringSync_0120
     * @tc.desc      : %%%s
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0120', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwelve').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringTwelve')
        .id, "format string", 12, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0120 value_one:' + value_one);
      expect(value_one).assertEqual('%format string');
      let value_two = resMgr.getStringSync(resource, "format string", 12, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0120 value_two:' + value_two);
      expect(value_two).assertEqual('%format string');
      let value_three = resMgr.getStringByNameSync('test_stringTwelve', "format string", 12, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0120 value_three:' + value_three);
      expect(value_three).assertEqual('%format string');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1300
     * @tc.name      : resourceManager_test_getStringSync_0130
     * @tc.desc      : %%%%f
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0130', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringThirteen').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringThirteen').id, 12.01);
      console.log('resourceManager_test_getStringSync_0130 value_one:' + value_one);
      expect(value_one).assertEqual('%%f');
      let value_two = resMgr.getStringSync(resource, 12.01);
      console.log('resourceManager_test_getStringSync_0130 value_two:' + value_two);
      expect(value_two).assertEqual('%%f');
      let value_three = resMgr.getStringByNameSync('test_stringThirteen', 12.01);
      console.log('resourceManager_test_getStringSync_0130 value_three:' + value_three);
      expect(value_three).assertEqual('%%f');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1400
     * @tc.name      : resourceManager_test_getStringSync_0140
     * @tc.desc      : %2$d %3$s %4$f(The second parameter is integer, the third is Chinese, the fourth is decimal)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0140', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringFourteen').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringFourteen').id,
        "format string", 10, "测试测试", 98.78);
      console.log('resourceManager_test_getStringSync_0140 value_one:' + value_one);
      expect(value_one).assertEqual('10 测试测试 98.78');
      let value_two = resMgr.getStringSync(resource, "format string", 10, "测试测试", 98.78);
      console.log('resourceManager_test_getStringSync_0140 value_two:' + value_two);
      expect(value_two).assertEqual('10 测试测试 98.78');
      let value_three = resMgr.getStringByNameSync('test_stringFourteen', "format string", 10, "测试测试", 98.78);
      console.log('resourceManager_test_getStringSync_0140 value_three:' + value_three);
      expect(value_three).assertEqual('10 测试测试 98.78');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1500
     * @tc.name      : resourceManager_test_getStringSync_0150
     * @tc.desc      : %2$d %3$s %4$f(The second parameter is integer in scientific notation,
     * the third is English, the fourth is decimal in scientific notation)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0150', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringFifteen').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringFifteen').id,
        "format string", 1.234568E+16, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0150 value_one:' + value_one);
      expect(value_one).assertEqual('12345680000000000 TestTest 0');
      let value_two = resMgr.getStringSync(resource, "format string", 1.234568E+16, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0150 value_two:' + value_two);
      expect(value_two).assertEqual('12345680000000000 TestTest 0');
      let value_three = resMgr.getStringByNameSync('test_stringFifteen',
        "format string", 1.234568E+16, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0150 value_three:' + value_three);
      expect(value_three).assertEqual('12345680000000000 TestTest 0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1600
     * @tc.name      : resourceManager_test_getStringSync_0160
     * @tc.desc      : %2$d %3$s %4$f %%d(The parameter is null)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0160', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringSixteen').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringSixteen').id);
      console.log('resourceManager_test_getStringSync_0160 value_one:' + value_one);
      expect(value_one).assertEqual('%2$d %3$s %4$f %d');
      let value_two = resMgr.getStringSync(resource);
      console.log('resourceManager_test_getStringSync_0160 value_two:' + value_two);
      expect(value_two).assertEqual('%2$d %3$s %4$f %d');
      let value_three = resMgr.getStringByNameSync('test_stringSixteen');
      console.log('resourceManager_test_getStringSync_0160 value_three:' + value_three);
      expect(value_three).assertEqual('%2$d %3$s %4$f %d');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1700
     * @tc.name      : resourceManager_test_getStringSync_0170
     * @tc.desc      : %d %1$d(The parameter is null)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0170', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringSeventeen').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringSeventeen').id);
      console.log('resourceManager_test_getStringSync_0170 value_one:' + value_one);
      expect(value_one).assertEqual('%d %1$d');
      let value_two = resMgr.getStringSync(resource);
      console.log('resourceManager_test_getStringSync_0170 value_two:' + value_two);
      expect(value_two).assertEqual('%d %1$d');
      let value_three = resMgr.getStringByNameSync('test_stringSeventeen');
      console.log('resourceManager_test_getStringSync_0170 value_three:' + value_three);
      expect(value_three).assertEqual('%d %1$d');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1800
     * @tc.name      : resourceManager_test_getStringSync_0180
     * @tc.desc      : %2$d %3$s %4$f(There are more parameters than placeholder indexes)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0180', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringEighteen').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringEighteen')
        .id, "format string", 30, "测试测试", 98.78, 1.234568E+16, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0180 value_one:' + value_one);
      expect(value_one).assertEqual('30 测试测试 98.78');
      let value_two = resMgr.getStringSync(resource, "format string",
        30, "测试测试", 98.78, 1.234568E+16, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0180 value_two:' + value_two);
      expect(value_two).assertEqual('30 测试测试 98.78');
      let value_three = resMgr.getStringByNameSync('test_stringEighteen',
        "format string", 30, "测试测试", 98.78, 1.234568E+16, "TestTest", 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0180 value_three:' + value_three);
      expect(value_three).assertEqual('30 测试测试 98.78');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_1900
     * @tc.name      : resourceManager_test_getStringSync_0190
     * @tc.desc      : %d %1$d(Inconsistent placeholder styles)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0190', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringNineteen').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringNineteen').id, 40);
      console.log('resourceManager_test_getStringSync_0190 value_one:' + value_one);
      expect(value_one).assertEqual('40 40');
      let value_two = resMgr.getStringSync(resource, 40);
      console.log('resourceManager_test_getStringSync_0190 value_two:' + value_two);
      expect(value_two).assertEqual('40 40');
      let value_three = resMgr.getStringByNameSync('test_stringNineteen', 40);
      console.log('resourceManager_test_getStringSync_0190 value_three:' + value_three);
      expect(value_three).assertEqual('40 40');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2000
     * @tc.name      : resourceManager_test_getStringSync_0200
     * @tc.desc      : %%%d %1$d(Inconsistent placeholder styles)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0200', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwenty').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringTwenty').id, 40);
      console.log('resourceManager_test_getStringSync_0200 value_one:' + value_one);
      expect(value_one).assertEqual('%40 40');
      let value_two = resMgr.getStringSync(resource, 40);
      console.log('resourceManager_test_getStringSync_0200 value_two:' + value_two);
      expect(value_two).assertEqual('%40 40');
      let value_three = resMgr.getStringByNameSync('test_stringTwenty', 40);
      console.log('resourceManager_test_getStringSync_0200 value_three:' + value_three);
      expect(value_three).assertEqual('%40 40');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2100
     * @tc.name      : resourceManager_test_getStringSync_0210
     * @tc.desc      : %d %d %s %s %f %f(Arguments and placeholder match and equal in number)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0210', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyOne').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringTwentyOne')
        .id, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0210 value_one:' + value_one);
      expect(value_one).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
      let value_two = resMgr.getStringSync(resource, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0210 value_two:' + value_two);
      expect(value_two).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
      let value_three = resMgr.getStringByNameSync('test_stringTwentyOne', 50,
        1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08);
      console.log('resourceManager_test_getStringSync_0210 value_three:' + value_three);
      expect(value_three).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2200
     * @tc.name      : resourceManager_test_getStringSync_0220
     * @tc.desc      : %d %d %s %s %f %f(The parameters is more than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0220', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyTwo').id
      };
      let value_one = resMgr.getStringSync($r('app.string.test_stringTwentyTwo')
        .id, 50, 1.234568E+16, "测试测试", "TestTest", 98.78, 1.234568e-08, 15, "format string", 15.01);
      console.log('resourceManager_test_getStringSync_0220 value_one:' + value_one);
      expect(value_one).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
      let value_two = resMgr.getStringSync(resource, 50, 1.234568E+16, "测试测试",
        "TestTest", 98.78, 1.234568e-0815, 15, "format string", 15.01);
      console.log('resourceManager_test_getStringSync_0220 value_two:' + value_two);
      expect(value_two).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
      let value_three = resMgr.getStringByNameSync('test_stringTwentyTwo', 50, 1.234568E+16,
        "测试测试", "TestTest", 98.78, 1.234568e-08, 15, "format string", 15.01);
      console.log('resourceManager_test_getStringSync_0220 value_three:' + value_three);
      expect(value_three).assertEqual('50 12345680000000000 测试测试 TestTest 98.78 0');
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2300
     * @tc.name      : resourceManager_test_getStringSync_0230
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0230', 0, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyThree').id);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0230' + error.code + error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2400
     * @tc.name      : resourceManager_test_getStringSync_0240
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0240', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyThree').id
      };
      try {
        resMgr.getStringSync(resource, 50);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0240' + error.code + error.message);
        expect(error.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2500
     * @tc.name      : resourceManager_test_getStringByNameSync_0250
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringByNameSync_0250', 0, () => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyThree');
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0250' + error.code + error.message);
        expect(error.code).assertEqual(9001008);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2600
     * @tc.name      : resourceManager_test_getStringSync_0260
     * @tc.desc      : The wrong parameter type
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0260', 0, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyFour').id, "format string", "format", "1.5", "string");
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0260' + error.code + error.message);
        expect(error.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2700
     * @tc.name      : resourceManager_test_getStringSync_0270
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0270', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyFour').id
      };
      try {
        resMgr.getStringSync(resource, "format string", "format", "1.5", "string");
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0270' + error.code + error.message);
        expect(error.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2800
     * @tc.name      : resourceManager_test_getStringByNameSync_0280
     * @tc.desc      : Parameter out of index
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringByNameSync_0280', 0, () => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyFour', "format string", "format", "1.5", "string");
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0280' + error.code + error.message);
        expect(error.code).assertEqual('9001008');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_2900
     * @tc.name      : resourceManager_test_getStringSync_0290
     * @tc.desc      : Parameters less than required
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0290', 0, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyFive').id);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0290' + error.code + error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_3000
     * @tc.name      : resourceManager_test_getStringSync_0300
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringSync_0300', 0, () => {
      let resMgr = res;
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwentyFive').id
      };
      try {
        resMgr.getStringSync(resource, 50);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0300' + error.code + error.message);
        expect(error.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_FormatStringIndex_3100
     * @tc.name      : resourceManager_test_getStringByNameSync_0310
     * @tc.desc      : %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getStringByNameSync_0310', 0, () => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyFive');
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0310' + error.code + error.message);
        expect(error.code).assertEqual(9001008);
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0020
     * @tc.name      : resourceManager_test_getSymbol_0020
     * @tc.desc      : getSymbol resource by reference
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0020', 0, () => {
      let value = res.getSymbol($r('app.symbol.symbolTestReference').id);
      console.log('resourceManager_test_getSymbol_0020:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0040
     * @tc.name      : resourceManager_test_getSymbol_0040
     * @tc.desc      : getSymbol resource resId invalid
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0040', 0, () => {
      try {
        let value = res.getSymbol(0x01234567);
        console.log('resourceManager_test_getSymbol_0040:' + value);
      } catch (e) {
        console.log('resourceManager_test_getSymbol_0040_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_0040_errorMessage' + e.message);
        expect(e.code == '9001001').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0050
     * @tc.name      : resourceManager_test_getSymbol_0050
     * @tc.desc      : getSymbol resource resId invalid
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0050', 0, () => {
      try {
        let value = res.getSymbol($r('app.string.test_stringTwo').id);
        console.log('resourceManager_test_getSymbol_0050:' + value);
      } catch (e) {
        console.log('resourceManager_test_getSymbol_0050_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_0050_errorMessage' + e.message);
        expect(e.code == '9001002').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0060
     * @tc.name      : resourceManager_test_getSymbol_0060
     * @tc.desc      : getSymbol resource resource re-ref too much by resId
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0060', 0, () => {
      try {
        let value = res.getSymbol($r('app.symbol.symbolTestA').id);
        console.log('resourceManager_test_getSymbol_0060:' + value);
      } catch (e) {
        console.log('resourceManager_test_getSymbol_0060_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_0060_errorMessage' + e.message);
        expect(e.code == '9001006').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0070
     * @tc.name      : resourceManager_test_getSymbol_0070
     * @tc.desc      : getSymbol normal resource object
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0070', 0, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.symbol.symbolTest1').id
      };
      let value = res.getSymbol(resource);
      console.log('resourceManager_test_getSymbol_0070:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0080
     * @tc.name      : resourceManager_test_getSymbol_0080
     * @tc.desc      : getSymbol normal reference resource
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0080', 0, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.symbol.symbolTestReference').id
      };
      let value = res.getSymbol(resource);
      console.log('resourceManager_test_getSymbol_0080:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0100
     * @tc.name      : resourceManager_test_getSymbol_0100
     * @tc.desc      : getSymbol resId invalid by resource object
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0100', 0, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      };
      try {
        let value = res.getSymbol(resource);
        console.log('resourceManager_test_getSymbol_0100:' + value);
      } catch (e) {
        console.log('resourceManager_test_getSymbol_0100_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_0100_errorMessage' + e.message);
        expect(e.code == '9001001').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0110
     * @tc.name      : resourceManager_test_getSymbol_0110
     * @tc.desc      : getSymbol resource not found by resource object
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0110', 0, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwo').id
      };
      try {
        let value = res.getSymbol(resource);
        console.log('resourceManager_test_getSymbol_0110:' + value);
      } catch (e) {
        console.log('resourceManager_test_getSymbol_0110_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_0110_errorMessage' + e.message);
        expect(e.code == '9001002').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0120
     * @tc.name      : resourceManager_test_getSymbol_0120
     * @tc.desc      : getSymbol resource re-ref too much by resource object
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0120', 0, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.symbol.symbolTestA').id
      };
      try {
        let value = res.getSymbol(resource);
        console.log('resourceManager_test_getSymbol_0120:' + value);
      } catch (e) {
        console.log('resourceManager_test_getSymbol_0120_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_0120_errorMessage' + e.message);
        expect(e.code == '9001006').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0140
     * @tc.name      : resourceManager_test_getSymbol_0140
     * @tc.desc      : getSymbolByName reference resource
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0140', 0, () => {
      let value = res.getSymbolByName('symbolTestReference');
      console.log('resourceManager_test_getSymbol_0140:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0160
     * @tc.name      : resourceManager_test_getSymbol_0160
     * @tc.desc      : getSymbolByName resName invalid
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0160', 0, () => {
      try {
        let value = res.getSymbolByName('invalidName');
        console.log('resourceManager_test_getSymbol_0160:' + value);
      } catch (e) {
        console.log('resourceManager_test_getSymbol_0160_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_0160_errorMessage' + e.message);
        expect(e.code == '9001003').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0180
     * @tc.name      : resourceManager_test_getSymbol_0180
     * @tc.desc      : getSymbolByName resource re-ref too much
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0180', 0, () => {
      try {
        let value = res.getSymbolByName('symbolTestB');
        console.log('resourceManager_test_getSymbol_0180:' + value);
      } catch (e) {
        console.log('resourceManager_test_getSymbol_0180_errorCode' + e.code);
        console.log('resourceManager_test_getSymbol_0180_errorMessage' + e.message);
        expect(e.code == '9001006').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0190
     * @tc.name      : resourceManager_test_getSymbol_0190
     * @tc.desc      : getSymbol normal resource by resId in Chinese
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0190', 0, () => {
      let value = res.getSymbol($r('app.symbol.symbolTest2').id);
      console.log('resourceManager_test_getSymbol_0190:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0200
     * @tc.name      : resourceManager_test_getSymbol_0200
     * @tc.desc      : getSymbol normal resource by resId in Chinese
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0200', 0, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.symbol.symbolTest2').id
      };
      let value = res.getSymbol(resource);
      console.log('resourceManager_test_getSymbol_0200:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_getSymbol_0210
     * @tc.name      : resourceManager_test_getSymbol_0210
     * @tc.desc      : getSymbolByName normal name ZH
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getSymbol_0210', 0, () => {
      let value = res.getSymbolByName('symbolTest2');
      console.log('resourceManager_test_getSymbol_0210:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_getDrawable_1400
     * @tc.name      : resourceManager_test_getDrawable_1400
     * @tc.desc      : getDrawableDescriptor with resource Object not exist resource id
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getDrawable_1400', 0, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      };
      try {
        let value = res.getDrawableDescriptor(resource);
        console.log('resourceManager_test_getDrawable_1400:' + value);
      } catch (e) {
        console.log('resourceManager_test_getDrawable_1400_errorCode' + e.code);
        console.log('resourceManager_test_getDrawable_1400_errorMessage' + e.message);
        expect(e.code == '9001001').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_getDrawable_0900
     * @tc.name      : resourceManager_test_getDrawable_0900
     * @tc.desc      : getDrawableDescriptorByName with not exist pic name
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getDrawable_0900', 0, () => {
      try {
        let value = res.getDrawableDescriptorByName('symbolTest2');
        console.log('resourceManager_test_getDrawable_0900:' + value);
      } catch (e) {
        console.log('resourceManager_test_getDrawable_0900_errorCode' + e.code);
        console.log('resourceManager_test_getDrawable_0900_errorMessage' + e.message);
        expect(e.code == '9001003').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0020
     * @tc.name      : resourceManager_test_getRawFdSync_0020
     * @tc.desc      : getRawFdSync with subdirectory non-empty file
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFdSync_0020', 0, () => {
      let value = res.getRawFdSync('A/test.txt');
      console.log('resourceManager_test_getRawFdSync_0020_fd' + value.fd);
      console.log('resourceManager_test_getRawFdSync_0020_offset' + value.offset);
      console.log('resourceManager_test_getRawFdSync_0020_length' + value.length);
      expect(value != null && value.length == 4).assertTrue();
      res.closeRawFdSync('A/test.txt');
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0030
     * @tc.name      : resourceManager_test_getRawFdSync_0030
     * @tc.desc      : getRawFdSync with subdirectory empty file
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFdSync_0030', 0, () => {
      let value = res.getRawFdSync('A/none.xml');
      console.log('resourceManager_test_getRawFdSync_0030_fd' + value.fd);
      console.log('resourceManager_test_getRawFdSync_0030_offset' + value.offset);
      console.log('resourceManager_test_getRawFdSync_0030_length' + value.length);
      expect(value != null && value.length == 0).assertTrue();
      res.closeRawFdSync('A/none.xml');
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0050
     * @tc.name      : resourceManager_test_getRawFdSync_0050
     * @tc.desc      : getRawFdSync with error path
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFdSync_0050', 0, () => {
      try {
        let value = res.getRawFdSync('error_path.xml');
        console.log('resourceManager_test_getRawFdSync_0050:' + value);
      } catch (e) {
        console.log('resourceManager_test_getRawFdSync_0050_errorCode' + e.code);
        console.log('resourceManager_test_getRawFdSync_0050_errorMessage' + e.message);
        expect(e.code == '9001005').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0170
     * @tc.name      : resourceManager_test_getRawFileContentSync_0170
     * @tc.desc      : getRawFileContentSync with subdirectory empty file
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFileContentSync_0170', 0, () => {
      let value = res.getRawFileContentSync('A/none.xml');
      console.log('resourceManager_test_getRawFileContentSync_0170:' + value);
      expect(value.length == 0).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0160
     * @tc.name      : resourceManager_test_getRawFileContentSync_0160
     * @tc.desc      : getRawFileContentSync with subdirectory non-empty file
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFileContentSync_0160', 0, () => {
      let value = res.getRawFileContentSync('A/test.txt');
      console.log('resourceManager_test_getRawFileContentSync_0160:' + value);
      expect(value.length == 4).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0190
     * @tc.name      : resourceManager_test_getRawFileContentSync_0190
     * @tc.desc      : getRawFileContentSync with error path
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFileContentSync_0190', 0, () => {
      try {
        let value = res.getRawFileContentSync('error_path.xml');
        console.log('resourceManager_test_getRawFileContentSync_0190:' + value);
      } catch (e) {
        console.log('resourceManager_test_getRawFileContentSync_0190_errorCode' + e.code);
        console.log('resourceManager_test_getRawFileContentSync_0190_errorMessage' + e.message);
        expect(e.code == '9001005').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0120
     * @tc.name      : resourceManager_test_getRawFileListSync_0120
     * @tc.desc      : getRawFileListSync with subdirectory
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFileListSync_0120', 0, () => {
      let value = res.getRawFileListSync('A');
      console.log('resourceManager_test_getRawFileListSync_0120:' + value);
      expect(value.length >= 102).assertTrue();
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0140
     * @tc.name      : resourceManager_test_getRawFileListSync_0140
     * @tc.desc      : getRawFileListSync with error path
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_getRawFileListSync_0140', 0, () => {
      try {
        let value = res.getRawFileListSync('error_path');
        console.log('resourceManager_test_getRawFileListSync_0140:' + value);
      } catch (e) {
        console.log('resourceManager_test_getRawFileListSync_0140_errorCode' + e.code);
        console.log('resourceManager_test_getRawFileListSync_0140_errorMessage' + e.message);
        expect(e.code == '9001005').assertTrue();
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_I18N_RawFileSync_0100
     * @tc.name      : resourceManager_test_closeRawFdSync_0100
     * @tc.desc      : closeRawFdSync with error path
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('resourceManager_test_closeRawFdSync_0100', 0, () => {
      try {
        let value = res.closeRawFdSync('error_path.xml');
        console.log('resourceManager_test_closeRawFdSync_0100:' + value);
      } catch (e) {
        console.log('resourceManager_test_closeRawFdSync_0100_errorCode' + e.code);
        console.log('resourceManager_test_closeRawFdSync_0100_errorMessage' + e.message);
        expect(e.code == '9001005').assertTrue();
      }
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_0300
     * @tc.name      : getStringArrayValue_stage_test_0300
     * @tc.desc      : errcode 9001001 in callback mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_0400
     * @tc.name      : getStringArrayValue_stage_test_0400
     * @tc.desc      : errcode 9001002 in callback mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.module_test_desc').id
      }, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_0500
     * @tc.name      : getStringArrayValue_stage_test_0500
     * @tc.desc      : errcode 9001006 in callback mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.strarray.sizeListThree').id
      }, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_0600
     * @tc.name      : getStringArrayValue_stage_test_0600
     * @tc.desc      : errcode 401 in callback mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_0600', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.strarray.sizeList').id
      }, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_0600 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_0700
     * @tc.name      : getStringArrayValue_stage_test_0700
     * @tc.desc      : errcode 9001001 in promise mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_0700', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_0700 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_0800
     * @tc.name      : getStringArrayValue_stage_test_0800
     * @tc.desc      : errcode 9001002 in promise mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_0800', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.module_test_desc').id
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_0800 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_0900
     * @tc.name      : getStringArrayValue_stage_test_0900
     * @tc.desc      : errcode 9001006 in promise mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_0900', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.strarray.sizeListThree').id
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_0900 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number    : getStringArrayValue_stage_test_1000
     * @tc.name      : getStringArrayValue_stage_test_1000
     * @tc.desc      : errcode 401 in promise mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValue_stage_test_1000', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.strarray.sizeList').id
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1000 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number    : getMediaContent_stage_test_0500
     * @tc.name      : getMediaContent_stage_test_0500
     * @tc.desc      : errcode 9001001 in callback mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContent_stage_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number    : getMediaContent_stage_test_0600
     * @tc.name      : getMediaContent_stage_test_0600
     * @tc.desc      : errcode 9001002 in callback mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContent_stage_test_0600', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.module_test_desc').id
      }, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_0600 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number    : getMediaContent_stage_test_0700
     * @tc.name      : getMediaContent_stage_test_0700
     * @tc.desc      : errcode 401 in callback mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContent_stage_test_0700', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.media.icon').id
      }, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_0700 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number    : getMediaContent_stage_test_0800
     * @tc.name      : getMediaContent_stage_test_0800
     * @tc.desc      : errcode 9001001 in callback mode with density
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContent_stage_test_0800', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, 0, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_0800 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number    : getMediaContent_stage_test_0900
     * @tc.name      : getMediaContent_stage_test_0900
     * @tc.desc      : errcode 9001002 in callback mode with density
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContent_stage_test_0900', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.module_test_desc').id
      }, 0, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_0900 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number    : getMediaContent_stage_test_1000
     * @tc.name      : getMediaContent_stage_test_1000
     * @tc.desc      : errcode 401 in callback mode with density
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContent_stage_test_1000', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.media.icon').id
      }, 0, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_1000 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number    : getMediaContent_stage_test_1100
     * @tc.name      : getMediaContent_stage_test_1100
     * @tc.desc      : errcode 9001001 in promise mode
     * @tc.size      : Medium Test
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContent_stage_test_1100', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_1100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_1200
     * @tc.name     : getMediaContent_stage_test_1200
     * @tc.desc     : errcode 9001002 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_1200', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.module_test_desc').id
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_1200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_1300
     * @tc.name     : getMediaContent_stage_test_1300
     * @tc.desc     : errcode 401 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_1300', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.media.icon').id
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_1300 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_1400
     * @tc.name     : getMediaContent_stage_test_1400
     * @tc.desc     : errcode 9001001 in promise mode with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_1400', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_1400 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_1500
     * @tc.name     : getMediaContent_stage_test_1500
     * @tc.desc     : errcode 9001002 in promise mode with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_1500', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.module_test_desc').id
      }, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_1500 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_1600
     * @tc.name     : getMediaContent_stage_test_1600
     * @tc.desc     : errcode 401 in promise mode with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_1600', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.media.icon').id
      }, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_1600 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })


    /**
     * @tc.number   : getStringValue_stage_test_0300
     * @tc.name     : getStringValue_stage_test_0300
     * @tc.desc     : errcode 401 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringValue_stage_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getStringValue({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.string.app_name').id
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringValue_stage_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_1100
     * @tc.name     : getStringArrayValue_stage_test_1100
     * @tc.desc     : errcode 9001001 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_1100', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue(0x01234567, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_1200
     * @tc.name     : getStringArrayValue_stage_test_1200
     * @tc.desc     : errcode 9001002 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_1200', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue($r('app.string.module_test_desc').id, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_1300
     * @tc.name     : getStringArrayValue_stage_test_1300
     * @tc.desc     : errcode 9001006 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_1300', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue($r('app.strarray.sizeListThree').id, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1300 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_1400
     * @tc.name     : getStringArrayValue_stage_test_1400
     * @tc.desc     : errcode 9001001 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_1400', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue(0x01234567).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1400 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_1500
     * @tc.name     : getStringArrayValue_stage_test_1500
     * @tc.desc     : errcode 9001002 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_1500', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue($r('app.string.module_test_desc').id).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1500 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_stage_test_1600
     * @tc.name     : getStringArrayValue_stage_test_1600
     * @tc.desc     : errcode 9001006 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_stage_test_1600', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue($r('app.strarray.sizeListThree').id).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1600 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_1700
     * @tc.name     : getMediaContent_stage_test_1700
     * @tc.desc     : errcode 9001001 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_1700', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent(0x01234567, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_1700 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_1800
     * @tc.name     : getMediaContent_stage_test_1800
     * @tc.desc     : errcode 9001002 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_1800', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent($r('app.string.module_test_desc').id, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_1800 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_1900
     * @tc.name     : getMediaContent_stage_test_1900
     * @tc.desc     : errcode 9001001 in callback mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_1900', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent(0x01234567, 0, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_1900 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_2000
     * @tc.name     : getMediaContent_stage_test_2000
     * @tc.desc     : errcode 9001002 in callback mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_2000', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent($r('app.string.module_test_desc').id, 0, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_2000 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_2100
     * @tc.name     : getMediaContent_stage_test_2100
     * @tc.desc     : errcode 9001001 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_2100', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent(0x01234567).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_2100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_2200
     * @tc.name     : getMediaContent_stage_test_2200
     * @tc.desc     : errcode 9001002 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_2200', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent($r('app.string.module_test_desc').id).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_2200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_2300
     * @tc.name     : getMediaContent_stage_test_2300
     * @tc.desc     : errcode 9001001 in promise mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_2300', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent(0x01234567, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_2300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_stage_test_2400
     * @tc.name     : getMediaContent_stage_test_2400
     * @tc.desc     : errcode 9001002 in promise mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_stage_test_2400', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent($r('app.string.module_test_desc').id, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContent_stage_test_2400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_0500
     * @tc.name     : getMediaContentBase64_stage_test_0500
     * @tc.desc     : errcode 9001001 in callback mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_0600
     * @tc.name     : getMediaContentBase64_stage_test_0600
     * @tc.desc     : errcode 9001002 in callback mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_0600', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwo').id
      }, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_0600 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_0700
     * @tc.name     : getMediaContentBase64_stage_test_0700
     * @tc.desc     : errcode 401 in callback mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_0700', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.media.icon').id
      }, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_0700 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_0800
     * @tc.name     : getMediaContentBase64_stage_test_0800
     * @tc.desc     : errcode 9001001 in callback mode with density by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_0800', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, 0, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_0800 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_0900
     * @tc.name     : getMediaContentBase64_stage_test_0900
     * @tc.desc     : errcode 9001002 in callback mode with density by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_0900', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwo').id
      }, 0, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_0900 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_1000
     * @tc.name     : getMediaContentBase64_stage_test_1000
     * @tc.desc     : errcode 401 in callback mode with density by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1000', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.media.icon').id
      }, 0, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1000 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_1100
     * @tc.name     : getMediaContentBase64_stage_test_1100
     * @tc.desc     : errcode 9001001 in promise mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1100', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1000 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_1200
     * @tc.name     : getMediaContentBase64_stage_test_1200
     * @tc.desc     : errcode 9001002 in promise mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1200', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwo').id
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_1300
     * @tc.name     : getMediaContentBase64_stage_test_1300
     * @tc.desc     : errcode 401 in promise mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1300', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.media.icon').id
      }).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1300 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_1400
     * @tc.name     : getMediaContentBase64_stage_test_1400
     * @tc.desc     : errcode 9001001 in promise mode by resObject with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1400', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1400 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })


    /**
     * @tc.number   : getMediaContentBase64_stage_test_1500
     * @tc.name     : getMediaContentBase64_stage_test_1500
     * @tc.desc     : errcode 9001002 in promise mode by resObject with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1500', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringTwo').id
      }, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1500 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_1600
     * @tc.name     : getMediaContentBase64_stage_test_1600
     * @tc.desc     : errcode 401 in promise mode by resObject with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1600', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.media.icon').id
      }, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1600 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })


    /**
     * @tc.number   : getMediaContentBase64_stage_test_1700
     * @tc.name     : getMediaContentBase64_stage_test_1700
     * @tc.desc     : errcode 9001001 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1700', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64(0x01234567, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1600 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_1800
     * @tc.name     : getMediaContentBase64_stage_test_1800
     * @tc.desc     : errcode 9001002 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1800', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64($r('app.string.test_stringTwo').id, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1600 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_1900
     * @tc.name     : getMediaContentBase64_stage_test_1900
     * @tc.desc     : errcode 9001001 in callback mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_1900', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64(0x01234567, 0, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1900 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })


    /**
     * @tc.number   : getMediaContentBase64_stage_test_2000
     * @tc.name     : getMediaContentBase64_stage_test_2000
     * @tc.desc     : errcode 9001002 in callback mode with density by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_2000', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64($r('app.string.test_stringTwo').id, 0, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_2000 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_2100
     * @tc.name     : getMediaContentBase64_stage_test_2100
     * @tc.desc     : errcode 9001001 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_2100', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64(0x01234567).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_2100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_stage_test_2200
     * @tc.name     : getMediaContentBase64_stage_test_2200
     * @tc.desc     : errcode 9001002 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_2200', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64($r('app.string.test_stringTwo').id).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_2200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })


    /**
     * @tc.number   : getMediaContentBase64_stage_test_2300
     * @tc.name     : getMediaContentBase64_stage_test_2300
     * @tc.desc     : errcode 9001001 in promise mode by resId with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_2300', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64(0x01234567, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_2300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })


    /**
     * @tc.number   : getMediaContentBase64_stage_test_2400
     * @tc.name     : getMediaContentBase64_stage_test_2400
     * @tc.desc     : errcode 9001002 in promise mode by resId with density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_stage_test_2400', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64($r('app.string.test_stringTwo').id, 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_2400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })


    /**
     * @tc.number   : getPluralStringValue_stage_test_0300
     * @tc.name     : getPluralStringValue_stage_test_0300
     * @tc.desc     : errcode 9001001 in callback mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */

    it('getPluralStringValue_stage_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })


    /**
     * @tc.number   : getPluralStringValue_stage_test_0400
     * @tc.name     : getPluralStringValue_stage_test_0400
     * @tc.desc     : errcode 9001002 in callback mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */

    it('getPluralStringValue_stage_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })


    /**
     * @tc.number   : getPluralStringValue_stage_test_0500
     * @tc.name     : getPluralStringValue_stage_test_0500
     * @tc.desc     : errcode 9001006 in callback mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.plural.plural_name_loop').id
      }, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_stage_test_0600
     * @tc.name     : getPluralStringValue_stage_test_0600
     * @tc.desc     : errcode 401 in callback mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_0600', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.plural.plural_name').id
      }, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_0600 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })


    /**
     * @tc.number   : getPluralStringValue_stage_test_0700
     * @tc.name     : getPluralStringValue_stage_test_0700
     * @tc.desc     : errcode 9001001 in promise mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_0700', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }, 2).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_0700 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_stage_test_0800
     * @tc.name     : getPluralStringValue_stage_test_0800
     * @tc.desc     : errcode 9001002 in promise mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_0800', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 2).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_0800 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_stage_test_0900
     * @tc.name     : getPluralStringValue_stage_test_0900
     * @tc.desc     : errcode 9001006 in promise mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_0900', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.plural.plural_name_loop').id
      }, 2).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_0900 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })


    /**
     * @tc.number   : getPluralStringValue_stage_test_1000
     * @tc.name     : getPluralStringValue_stage_test_1000
     * @tc.desc     : errcode 401 in promise mode by resObject
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_1000', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue({
        bundleName: "error",
        moduleName: "error",
        id: $r('app.plural.plural_name').id
      }, 2).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1000 error code:' + err.code);
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_stage_test_1100
     * @tc.name     : getPluralStringValue_stage_test_1100
     * @tc.desc     : errcode 9001001 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_1100', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue(0x01234567, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_stage_test_1200
     * @tc.name     : getPluralStringValue_stage_test_1200
     * @tc.desc     : errcode 9001001 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_1200', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue($r('app.media.icon').id, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_stage_test_1300
     * @tc.name     : getPluralStringValue_stage_test_1300
     * @tc.desc     : errcode 9001006 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_1300', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue($r('app.plural.plural_name_loop').id, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1300 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_stage_test_1400
     * @tc.name     : getPluralStringValue_stage_test_1400
     * @tc.desc     : errcode 9001001 in callback mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_1400', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue(0x01234567, 2).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1400 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })


    /**
     * @tc.number   : getPluralStringValue_stage_test_1500
     * @tc.name     : getPluralStringValue_stage_test_1500
     * @tc.desc     : errcode 9001002 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('getPluralStringValue_stage_test_1500', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue($r('app.media.icon').id, 2).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1500 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })


    /**
     * @tc.number   : getPluralStringValue_stage_test_1600
     * @tc.name     : getPluralStringValue_stage_test_1600
     * @tc.desc     : errcode 9001006 in promise mode by resId
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_stage_test_1600', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue($r('app.plural.plural_name_loop').id, 2).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1600 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getStringByName_stage_test_0100
     * @tc.name     : getStringByName_stage_test_0100
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByName_stage_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getStringByName('', (err: BusinessError) => {
        console.log('getStringByName_stage_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getStringByName_stage_test_0200
     * @tc.name     : getStringByName_stage_test_0200
     * @tc.desc     : errcode 9001006 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByName_stage_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getStringByName('test_stringLoopA', (err: BusinessError) => {
        console.log('getStringByName_stage_test_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })


    /**
     * @tc.number   : getStringByName_stage_test_0300
     * @tc.name     : getStringByName_stage_test_0300
     * @tc.desc     : errcode 9001003 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByName_stage_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getStringByName('').then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringByName_stage_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getStringByName_stage_test_0400
     * @tc.name     : getStringByName_stage_test_0400
     * @tc.desc     : errcode 9001006 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByName_stage_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getStringByName('test_stringLoopA').then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringByName_stage_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayByName_stage_test_0100
     * @tc.name     : getStringArrayByName_stage_test_0100
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayByName_stage_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayByName('', (err: BusinessError) => {
        console.log('getStringArrayByName_stage_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayByName_stage_test_0200
     * @tc.name     : getStringArrayByName_stage_test_0200
     * @tc.desc     : errcode 9001006 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayByName_stage_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayByName('sizeListThree', (err: BusinessError) => {
        console.log('getStringArrayByName_stage_test_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayByName_stage_test_0300
     * @tc.name     : getStringArrayByName_stage_test_0300
     * @tc.desc     : errcode 9001003 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayByName_stage_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayByName('').then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayByName_stage_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayByName_stage_test_0400
     * @tc.name     : getStringArrayByName_stage_test_0400
     * @tc.desc     : errcode 9001006 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayByName_stage_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayByName('sizeListThree').then(() => {
      }).catch((err: BusinessError) => {
        console.log('getStringArrayByName_stage_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getMediaByName_test_0300
     * @tc.name     : getMediaByName_test_0300
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getMediaByName('', (err: BusinessError) => {
        console.log('getMediaByName_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaByName_test_0400
     * @tc.name     : getMediaByName_test_0400
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getMediaByName('', 0, (err: BusinessError) => {
        console.log('getMediaByName_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaByName_test_0500
     * @tc.name     : getMediaByName_test_0500
     * @tc.desc     : errcode 9001003 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getMediaByName('').then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaByName_test_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaByName_test_0600
     * @tc.name     : getMediaByName_test_0600
     * @tc.desc     : errcode 9001003 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_test_0600', Level.LEVEL3, async (done: Function) => {
      res.getMediaByName('', 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaByName_test_0600 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaBase64ByName_test_0300
     * @tc.name     : getMediaBase64ByName_test_0300
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64ByName('', (err: BusinessError) => {
        console.log('getMediaBase64ByName_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaBase64ByName_test_0400
     * @tc.name     : getMediaBase64ByName_test_0400
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64ByName('', 0, (err: BusinessError) => {
        console.log('getMediaBase64ByName_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaBase64ByName_test_0500
     * @tc.name     : getMediaBase64ByName_test_0500
     * @tc.desc     : errcode 9001003 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64ByName('').then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaBase64ByName_test_0500 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getMediaBase64ByName_test_0600
     * @tc.name     : getMediaBase64ByName_test_0600
     * @tc.desc     : errcode 9001003 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_test_0600', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64ByName('', 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getMediaBase64ByName_test_0600 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringByName_test_0100
     * @tc.name     : getPluralStringByName_test_0100
     * @tc.desc     : errcode 9001003 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringByName_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringByName('', 0, (err: BusinessError) => {
        console.log('getPluralStringByName_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringByName_test_0200
     * @tc.name     : getPluralStringByName_test_0200
     * @tc.desc     : errcode 9001006 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringByName_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringByName('plural_name_loop', 0, (err: BusinessError) => {
        console.log('getPluralStringByName_test_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringByName_test_0300
     * @tc.name     : getPluralStringByName_test_0300
     * @tc.desc     : errcode 9001003 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringByName_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringByName('', 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringByName_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringByName_test_0400
     * @tc.name     : getPluralStringByName_test_0400
     * @tc.desc     : errcode 9001006 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringByName_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringByName('plural_name_loop', 0).then(() => {
      }).catch((err: BusinessError) => {
        console.log('getPluralStringByName_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.number   : getStringSync_test_0100
     * @tc.name     : getStringSync_test_0100
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0100', Level.LEVEL3, () => {
      try {
        res.getStringSync($r('app.color.color_test1').id)
      } catch (err) {
        console.log('getStringSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getStringSync_test_0200
     * @tc.name     : getStringSync_test_0200
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0200', Level.LEVEL3, () => {
      try {
        res.getStringSync($r('app.string.test_stringLoopA').id)
      } catch (err) {
        console.log('getStringSync_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringSync_test_0300
     * @tc.name     : getStringSync_test_0300
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0300', Level.LEVEL3, () => {
      try {
        res.getStringSync($r('app.color.color_test1').id, 'test', 1)
      } catch (err) {
        console.log('getStringSync_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getStringSync_test_0400
     * @tc.name     : getStringSync_test_0400
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0400', Level.LEVEL3, () => {
      try {
        res.getStringSync($r('app.string.test_stringLoopA').id, 'test', 1)
      } catch (err) {
        console.log('getStringSync_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringSync_test_0500
     * @tc.name     : getStringSync_test_0500
     * @tc.desc     : errcode 9001007
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0500', Level.LEVEL3, () => {
      try {
        res.getStringSync($r('app.string.test_stringTwentyThree').id, 'test', 1)
      } catch (err) {
        console.log('getStringSync_test_0500 error code:' + err.code);
        expect(err.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.number   : getStringSync_test_0600
     * @tc.name     : getStringSync_test_0600
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0600', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01234567)
      } catch (err) {
        console.log('getStringSync_test_0600 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getStringSync_test_0700
     * @tc.name     : getStringSync_test_0700
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0700', Level.LEVEL3, () => {
      try {
        res.getStringSync(0x01234567, 'aaa', 0)
      } catch (err) {
        console.log('getStringSync_test_0700 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getStringSync_test_0800
     * @tc.name     : getStringSync_test_0800
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0800', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      };
      try {
        res.getStringSync(resource)
      } catch (err) {
        console.log('getStringSync_test_0800 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getStringSync_test_0900
     * @tc.name     : getStringSync_test_0900
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_0900', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      };
      try {
        res.getStringSync(resource)
      } catch (err) {
        console.log('getStringSync_test_0900 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getStringSync_test_1000
     * @tc.name     : getStringSync_test_1000
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_1000', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringLoopA').id
      };
      try {
        res.getStringSync(resource)
      } catch (err) {
        console.log('getStringSync_test_1000 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringSync_test_1100
     * @tc.name     : getStringSync_test_1100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_1100', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      };
      try {
        res.getStringSync(resource, 'aaa', 0)
      } catch (err) {
        console.log('getStringSync_test_1100 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getStringSync_test_1200
     * @tc.name     : getStringSync_test_1200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_1200', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      };
      try {
        res.getStringSync(resource, 'aaa', 0)
      } catch (err) {
        console.log('getStringSync_test_1200 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getStringSync_test_1300
     * @tc.name     : getStringSync_test_1300
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_1300', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.string.test_stringLoopA').id
      };
      try {
        res.getStringSync(resource, 'aaa', 0)
      } catch (err) {
        console.log('getStringSync_test_1300 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringByNameSync_test_0100
     * @tc.name     : getStringByNameSync_test_0100
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByNameSync_test_0100', Level.LEVEL3, () => {
      try {
        res.getStringByNameSync('test_stringLoopB')
      } catch (err) {
        console.log('getStringByNameSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getStringByNameSync_test_0300
     * @tc.name     : getStringByNameSync_test_0300
     * @tc.desc     : errcode 9001003
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByNameSync_test_0300', Level.LEVEL3, () => {
      try {
        res.getStringByNameSync('boolean_2', 'aaa', 1)
      } catch (err) {
        console.log('getStringByNameSync_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number   : getStringByNameSync_test_0400
     * @tc.name     : getStringByNameSync_test_0400
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByNameSync_test_0400', Level.LEVEL3, () => {
      try {
        res.getStringByNameSync('test_stringLoopB', 'aaa', 1)
      } catch (err) {
        console.log('getStringByNameSync_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getBoolean_test_0100
     * @tc.name     : getBoolean_test_0100
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBoolean_test_0100', Level.LEVEL3, () => {
      try {
        res.getBoolean($r("app.boolean.boolean_4").id)
      } catch (err) {
        console.log('getBoolean_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getBoolean_test_0200
     * @tc.name     : getBoolean_test_0200
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBoolean_test_0200', Level.LEVEL3, () => {
      try {
        res.getBoolean(0x01234567)
      } catch (err) {
        console.log('getBoolean_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })


    /**
     * @tc.number   : getBoolean_test_0300
     * @tc.name     : getBoolean_test_0300
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBoolean_test_0300', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.boolean.boolean_4').id
      };
      try {
        res.getBoolean(resource)
      } catch (err) {
        console.log('getBoolean_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getBoolean_test_0400
     * @tc.name     : getBoolean_test_0400
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBoolean_test_0400', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      };
      try {
        res.getBoolean(resource)
      } catch (err) {
        console.log('getBoolean_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })


    /**
     * @tc.number   : getBoolean_test_0500
     * @tc.name     : getBoolean_test_0500
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBoolean_test_0500', Level.LEVEL3, () => {
      try {
        res.getBoolean($r('app.color.color_test1').id)
      } catch (err) {
        console.log('getBoolean_test_0500 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getBoolean_test_0600
     * @tc.name     : getBoolean_test_0600
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBoolean_test_0600', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      };
      try {
        res.getBoolean(resource)
      } catch (err) {
        console.log('getBoolean_test_0600 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getBooleanByName_test_0100
     * @tc.name     : getBooleanByName_test_0100
     * @tc.desc     : errcode 9001003
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBooleanByName_test_0100', Level.LEVEL3, () => {
      try {
        res.getBooleanByName("")
      } catch (err) {
        console.log('getBooleanByName_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number   : getBooleanByName_test_0200
     * @tc.name     : getBooleanByName_test_0200
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBooleanByName_test_0200', Level.LEVEL3, () => {
      try {
        res.getBooleanByName("boolean_4")
      } catch (err) {
        console.log('getBooleanByName_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getNumber_test_0100
     * @tc.name     : getNumber_test_0100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_0100', Level.LEVEL3, () => {
      try {
        res.getNumber(0x01234567)
      } catch (err) {
        console.log('getNumber_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getNumber_test_0200
     * @tc.name     : getNumber_test_0200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_0200', Level.LEVEL3, () => {
      try {
        res.getNumber($r('app.color.color_test1').id)
      } catch (err) {
        console.log('getNumber_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getNumber_test_0300
     * @tc.name     : getNumber_test_0300
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_0300', Level.LEVEL3, () => {
      try {
        res.getNumber($r('app.float.float_loopA').id)
      } catch (err) {
        console.log('getNumber_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getNumber_test_0400
     * @tc.name     : getNumber_test_0400
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_0400', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }
      try {
        res.getNumber(resource)
      } catch (err) {
        console.log('getNumber_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getNumber_test_0500
     * @tc.name     : getNumber_test_0500
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_0500', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      }
      try {
        res.getNumber(resource)
      } catch (err) {
        console.log('getNumber_test_0500 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getNumber_test_0600
     * @tc.name     : getNumber_test_0600
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_test_0600', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.float.float_loopA').id
      }
      try {
        res.getNumber(resource)
      } catch (err) {
        console.log('getNumber_test_0600 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getNumberByName_test_0100
     * @tc.name     : getNumberByName_test_0100
     * @tc.desc     : errcode 9001003
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumberByName_test_0100', Level.LEVEL3, () => {
      try {
        res.getNumberByName('')
      } catch (err) {
        console.log('getNumberByName_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number   : getNumberByName_test_0200
     * @tc.name     : getNumberByName_test_0200
     * @tc.desc     : errcode 9001006
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumberByName_test_0200', Level.LEVEL3, () => {
      try {
        res.getNumberByName('float_loopA')
      } catch (err) {
        console.log('getNumberByName_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number   : getRawFileContent_test_0100
     * @tc.name     : getRawFileContent_test_0100
     * @tc.desc     : errcode 9001005 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileContent_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getRawFileContent('plural_name_loop', (err: BusinessError) => {
        console.log('getRawFileContent_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001005);
        done();
      })
    })

    /**
     * @tc.number   : getRawFileContent_test_0200
     * @tc.name     : getRawFileContent_test_0200
     * @tc.desc     : errcode 9001005 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileContent_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getRawFileContent('plural_name_loop').then(() => {
      }).catch((err: BusinessError) => {
        console.log('getRawFileContent_test_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001005);
        done();
      })
    })

    /**
     * @tc.number   : getRawFd_test_0100
     * @tc.name     : getRawFd_test_0100
     * @tc.desc     : errcode 9001005 in callback mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFd_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getRawFd('plural_name_loop', (err: BusinessError) => {
        console.log('getRawFd_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001005);
        done();
      })
    })

    /**
     * @tc.number   : getRawFd_test_0200
     * @tc.name     : getRawFd_test_0200
     * @tc.desc     : errcode 9001005 in promise mode
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFd_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getRawFd('plural_name_loop').then(() => {
      }).catch((err: BusinessError) => {
        console.log('getRawFd_test_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001005);
        done();
      })
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_0200
     * @tc.name     : getDrawableDescriptor_stage_test_0200
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_0200', Level.LEVEL3, () => {
      try {
        res.getDrawableDescriptor(0x01234567)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_0300
     * @tc.name     : getDrawableDescriptor_stage_test_0300
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_0300', Level.LEVEL3, () => {
      try {
        res.getDrawableDescriptor($r('app.color.color_test1').id)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_0400
     * @tc.name     : getDrawableDescriptor_stage_test_0400
     * @tc.desc     : errcode 9001001 debsity?
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_0400', Level.LEVEL3, () => {
      try {
        res.getDrawableDescriptor(0x01234567, 0)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_0500
     * @tc.name     : getDrawableDescriptor_stage_test_0500
     * @tc.desc     : errcode 9001002 density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_0500', Level.LEVEL3, () => {
      try {
        res.getDrawableDescriptor($r('app.color.color_test1').id, 0)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_0500 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_0600
     * @tc.name     : getDrawableDescriptor_stage_test_0600
     * @tc.desc     : errcode 9001001 density? type?
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_0600', Level.LEVEL3, () => {
      try {
        res.getDrawableDescriptor(0x01234567, 0, 1)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_0600 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_0700
     * @tc.name     : getDrawableDescriptor_stage_test_0700
     * @tc.desc     : errcode 9001002 density? type?
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_0700', Level.LEVEL3, () => {
      try {
        res.getDrawableDescriptor($r('app.color.color_test1').id, 0, 1)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_0700 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_0800
     * @tc.name     : getDrawableDescriptor_stage_test_0800
     * @tc.desc     : errcode 9001001 Resource
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_0800', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }
      try {
        res.getDrawableDescriptor(resource)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_0800 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_0900
     * @tc.name     : getDrawableDescriptor_stage_test_0900
     * @tc.desc     : errcode 9001002 Resource
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_0900', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      }
      try {
        res.getDrawableDescriptor(resource)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_0900 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })


    /**
     * @tc.number   : getDrawableDescriptor_stage_test_1000
     * @tc.name     : getDrawableDescriptor_stage_test_1000
     * @tc.desc     : errcode 9001001 Resource density?
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_1000', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }
      try {
        res.getDrawableDescriptor(resource, 0)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_1000 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_1100
     * @tc.name     : getDrawableDescriptor_stage_test_1100
     * @tc.desc     : errcode 9001002 Resource  debsity?
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_1100', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      }
      try {
        res.getDrawableDescriptor(resource, 0)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_1100 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })


    /**
     * @tc.number   : getDrawableDescriptor_stage_test_1200
     * @tc.name     : getDrawableDescriptor_stage_test_1200
     * @tc.desc     : errcode 9001001 Resource debsity? type?
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_1200', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }
      try {
        res.getDrawableDescriptor(resource, 0, 1)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_1200 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_stage_test_1300
     * @tc.name     : getDrawableDescriptor_stage_test_1300
     * @tc.desc     : errcode 9001002 Resource
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_stage_test_1300', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      }
      try {
        res.getDrawableDescriptor(resource, 0, 1)
      } catch (err) {
        console.log('getDrawableDescriptor_stage_test_1300 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptorByName_test_0100
     * @tc.name     : getDrawableDescriptorByName_test_0100
     * @tc.desc     : errcode 9001003 debsity? type?
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptorByName_test_0100', Level.LEVEL3, () => {
      try {
        res.getDrawableDescriptorByName('test_stringLoopA', 0, 1)
      } catch (err) {
        console.log('getDrawableDescriptorByName_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number   : getDrawableDescriptorByName_test_0200
     * @tc.name     : getDrawableDescriptorByName_test_0200
     * @tc.desc     : errcode 9001003 debsity?
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptorByName_test_0200', Level.LEVEL3, () => {
      try {
        res.getDrawableDescriptorByName('', 0)
      } catch (err) {
        console.log('getDrawableDescriptorByName_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number   : getRawFdSync_test_0100
     * @tc.name     : getRawFdSync_test_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFdSync_test_0100', Level.LEVEL3, () => {
      try {
        res.getRawFdSync('notExist')
      } catch (err) {
        console.log('getRawFdSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001005');
      }
    })

    /**
     * @tc.number   : closeRawFdSync_test_0100
     * @tc.name     : closeRawFdSync_test_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('closeRawFdSync_test_0100', Level.LEVEL3, () => {
      try {
        res.closeRawFdSync('notExist')
      } catch (err) {
        console.log('closeRawFdSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001005');
      }
    })

    /**
     * @tc.number   : getRawFileListSync_test_0100
     * @tc.name     : getRawFileListSync_test_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileListSync_test_0100', Level.LEVEL3, () => {
      try {
        res.getRawFileListSync('notExist')
      } catch (err) {
        console.log('getRawFileListSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001005');
      }
    })

    /**
     * @tc.number   : getRawFileContentSync_test_0100
     * @tc.name     : getRawFileContentSync_test_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileContentSync_test_0100', Level.LEVEL3, () => {
      try {
        res.getRawFileContentSync('notExist')
      } catch (err) {
        console.log('getRawFileContentSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001005');
      }
    })

    /**
     * @tc.number   : getMediaContentSync_test_0100
     * @tc.name     : getMediaContentSync_test_0100
     * @tc.desc     : errcode 9001001
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentSync_test_0100', Level.LEVEL3, () => {
      try {
        res.getMediaContentSync(0x01234567)
      } catch (err) {
        console.log('getMediaContentSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getMediaContentSync_test_0200
     * @tc.name     : getMediaContentSync_test_0200
     * @tc.desc     : errcode 9001002
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentSync_test_0200', Level.LEVEL3, () => {
      try {
        res.getMediaContentSync($r('app.color.color_test1').id)
      } catch (err) {
        console.log('getMediaContentSync_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number   : getMediaContentSync_test_0300
     * @tc.name     : getMediaContentSync_test_0300
     * @tc.desc     : errcode 9001001 Resource density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentSync_test_0300', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: 0x01234567
      }
      try {
        res.getMediaContentSync(resource)
      } catch (err) {
        console.log('getMediaContentSync_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number   : getMediaContentSync_test_0400
     * @tc.name     : getMediaContentSync_test_0400
     * @tc.desc     : errcode 9001002 Resource density
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentSync_test_0400', Level.LEVEL3, () => {
      let resource: resourceManager.Resource = {
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.color.color_test1').id
      }
      try {
        res.getMediaContentSync(resource)
      } catch (err) {
        console.log('getMediaContentSync_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })


    /**
     * @tc.number    : getMediaContentSync_test_0500
     * @tc.name      : getMediaContentSync_test_0500
     * @tc.desc      : getMediaContentSync with res id density
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentSync_test_0500', 0, () => {
      let value: Uint8Array = res.getMediaContentSync($r('app.media.icon').id, 0);
      console.log('getMediaContentSync_test_0500 1' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaContentSync_test_0600
     * @tc.name      : getMediaContentSync_test_0600
     * @tc.desc      : getMediaContentSync with resource object density
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getMediaContentSync_test_0600', 0, () => {
      let value: Uint8Array = res.getMediaContentSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 0);
      console.log('getMediaContentSync_test_0600 1' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_0100
     * @tc.name      : getMediaContentBase64Sync_test_0100
     * @tc.desc      : getMediaContentBase64Sync with res id density
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaContentBase64Sync_test_0100', Level.LEVEL2, () => {
      let value: string = res.getMediaContentBase64Sync($r('app.media.icon').id, 0);
      console.log('getMediaContentBase64Sync_test_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_0200
     * @tc.name      : getMediaContentBase64Sync_test_0200
     * @tc.desc      : getMediaContentBase64Sync with resource object density
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaContentBase64Sync_test_0200', Level.LEVEL2, () => {
      let value: string = res.getMediaContentBase64Sync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 0);
      console.log('getMediaContentBase64Sync_test_0200:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_0300
     * @tc.name      : getMediaContentBase64Sync_test_0300
     * @tc.desc      : error code 9001001 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContentBase64Sync_test_0300', Level.LEVEL3, () => {
      try{
        res.getMediaContentBase64Sync(0x01234567);
      } catch (err) {
        console.log('getMediaContentBase64Sync_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_0400
     * @tc.name      : getMediaContentBase64Sync_test_0400
     * @tc.desc      : error code 9001001 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContentBase64Sync_test_0400', Level.LEVEL3, () => {
      try{
        res.getMediaContentBase64Sync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: 0x01234567
        });
      } catch (err) {
        console.log('getMediaContentBase64Sync_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_0500
     * @tc.name      : getMediaContentBase64Sync_test_0500
     * @tc.desc      : error code 9001002 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContentBase64Sync_test_0500', Level.LEVEL3, () => {
      try{
        res.getMediaContentBase64Sync($r('app.string.module_test_desc').id);
      } catch (err) {
        console.log('getMediaContentBase64Sync_test_0500 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number    : getMediaContentBase64Sync_test_0600
     * @tc.name      : getMediaContentBase64Sync_test_0600
     * @tc.desc      : error code 9001002 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaContentBase64Sync_test_0600', Level.LEVEL3, () => {
      try{
        res.getMediaContentBase64Sync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.string.module_test_desc').id
        });
      } catch (err) {
        console.log('getMediaContentBase64Sync_test_0600 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number    : getPluralStringValueSync_test_0100
     * @tc.name      : getPluralStringValueSync_test_0100
     * @tc.desc      : error code 9001001 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getPluralStringValueSync_test_0100', Level.LEVEL3, () => {
      try{
        res.getPluralStringValueSync(0x01234567, 1);
      } catch (err) {
        console.log('getPluralStringValueSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number    : getPluralStringValueSync_test_0200
     * @tc.name      : getPluralStringValueSync_test_0200
     * @tc.desc      : error code 9001001 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getPluralStringValueSync_test_0200', Level.LEVEL3, () => {
      try{
        res.getPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: 0x01234567
        }, 1);
      } catch (err) {
        console.log('getPluralStringValueSync_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number    : getPluralStringValueSync_test_0300
     * @tc.name      : getPluralStringValueSync_test_0300
     * @tc.desc      : error code 9001002 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getPluralStringValueSync_test_0300', Level.LEVEL3, () => {
      try{
        res.getPluralStringValueSync($r('app.string.module_test_desc').id, 1);
      } catch (err) {
        console.log('getPluralStringValueSync_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number    : getPluralStringValueSync_test_0400
     * @tc.name      : getPluralStringValueSync_test_0400
     * @tc.desc      : error code 9001002 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getPluralStringValueSync_test_0400', Level.LEVEL3, () => {
      try{
        res.getPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.string.module_test_desc').id
        }, 1);
      } catch (err) {
        console.log('getPluralStringValueSync_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number    : getPluralStringValueSync_test_0500
     * @tc.name      : getPluralStringValueSync_test_0500
     * @tc.desc      : error code 9001006 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getPluralStringValueSync_test_0500', Level.LEVEL3, () => {
      try{
        res.getPluralStringValueSync($r('app.plural.plural_name_loop').id, 2);
      } catch (err) {
        console.log('getPluralStringValueSync_test_0500 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number    : getPluralStringValueSync_test_0600
     * @tc.name      : getPluralStringValueSync_test_0600
     * @tc.desc      : error code 9001006 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getPluralStringValueSync_test_0600', Level.LEVEL3, () => {
      try{
        res.getPluralStringValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.plural.plural_name_loop').id
        }, 2);
      } catch (err) {
        console.log('getPluralStringValueSync_test_0600 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_0100
     * @tc.name      : getStringArrayValueSync_test_0100
     * @tc.desc      : error code 9001001 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_0100', Level.LEVEL3, () => {
      try{
        res.getStringArrayValueSync(0x01234567);
      } catch (err) {
        console.log('getStringArrayValueSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_0200
     * @tc.name      : getStringArrayValueSync_test_0200
     * @tc.desc      : error code 9001001 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_0200', Level.LEVEL3, () => {
      try{
        res.getStringArrayValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: 0x01234567
        });
      } catch (err) {
        console.log('getStringArrayValueSync_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001001');
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_0300
     * @tc.name      : getStringArrayValueSync_test_0300
     * @tc.desc      : error code 9001002 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_0300', Level.LEVEL3, () => {
      try{
        res.getStringArrayValueSync($r('app.string.module_test_desc').id);
      } catch (err) {
        console.log('getStringArrayValueSync_test_0300 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_0400
     * @tc.name      : getStringArrayValueSync_test_0400
     * @tc.desc      : error code 9001002 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_0400', Level.LEVEL3, () => {
      try{
        res.getStringArrayValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.string.module_test_desc').id
        });
      } catch (err) {
        console.log('getStringArrayValueSync_test_0400 error code:' + err.code);
        expect(err.code).assertEqual('9001002');
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_0500
     * @tc.name      : getStringArrayValueSync_test_0500
     * @tc.desc      : error code 9001006 with id
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_0500', Level.LEVEL3, () => {
      try{
        res.getStringArrayValueSync($r('app.strarray.sizeListThree').id);
      } catch (err) {
        console.log('getStringArrayValueSync_test_0500 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number    : getStringArrayValueSync_test_0600
     * @tc.name      : getStringArrayValueSync_test_0600
     * @tc.desc      : error code 9001006 with object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayValueSync_test_0600', Level.LEVEL3, () => {
      try{
        res.getStringArrayValueSync({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.strarray.sizeListThree').id
        });
      } catch (err) {
        console.log('getStringArrayValueSync_test_0600 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number    : getPluralStringByNameSync_test_0100
     * @tc.name      : getPluralStringByNameSync_test_0100
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getPluralStringByNameSync_test_0100', Level.LEVEL3, () => {
      try{
        res.getPluralStringByNameSync('invalidName', 2);
      } catch (err) {
        console.log('getPluralStringByNameSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number    : getPluralStringByNameSync_test_0200
     * @tc.name      : getPluralStringByNameSync_test_0200
     * @tc.desc      : error code 9001006 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getPluralStringByNameSync_test_0200', Level.LEVEL3, () => {
      try{
        res.getPluralStringByNameSync('plural_name_loop', 2);
      } catch (err) {
        console.log('getPluralStringByNameSync_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number    : getMediaByNameSync_test_0100
     * @tc.name      : getMediaByNameSync_test_0100
     * @tc.desc      : with density by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaByNameSync_test_0100', Level.LEVEL2, () => {
      let value: Uint8Array = res.getMediaByNameSync('icon', 0);
      console.log('getMediaByNameSync_test_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaByNameSync_test_0200
     * @tc.name      : getMediaByNameSync_test_0200
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaByNameSync_test_0200', Level.LEVEL3, () => {
      try{
        res.getMediaByNameSync('invalidName', 0);
      } catch (err) {
        console.log('getMediaByNameSync_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number    : getMediaBase64ByNameSync_test_0100
     * @tc.name      : getMediaBase64ByNameSync_test_0100
     * @tc.desc      : with density by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getMediaBase64ByNameSync_test_0100', Level.LEVEL2, () => {
      let value: string = res.getMediaBase64ByNameSync('icon', 0);
      console.log('getMediaBase64ByNameSync_test_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.number    : getMediaBase64ByNameSync_test_0200
     * @tc.name      : getMediaBase64ByNameSync_test_0200
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getMediaBase64ByNameSync_test_0200', Level.LEVEL3, () => {
      try{
        res.getMediaBase64ByNameSync('invalidName', 0);
      } catch (err) {
        console.log('getMediaBase64ByNameSync_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number    : getStringArrayByNameSync_test_0100
     * @tc.name      : getStringArrayByNameSync_test_0100
     * @tc.desc      : error code 9001003 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayByNameSync_test_0100', Level.LEVEL3, () => {
      try{
        res.getStringArrayByNameSync('invalidName');
      } catch (err) {
        console.log('getStringArrayByNameSync_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001003');
      }
    })

    /**
     * @tc.number    : getStringArrayByNameSync_test_0200
     * @tc.name      : getStringArrayByNameSync_test_0200
     * @tc.desc      : error code 9001006 by name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('getStringArrayByNameSync_test_0200', Level.LEVEL3, () => {
      try{
        res.getStringArrayByNameSync('sizeListThree');
      } catch (err) {
        console.log('getStringArrayByNameSync_test_0200 error code:' + err.code);
        expect(err.code).assertEqual('9001006');
      }
    })

    /**
     * @tc.number    : SUB_GLOBAL_GetLocales_0020
     * @tc.name      : getLocales with parameter false
     * @tc.desc      : getLocales
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_GLOBAL_GetLocales_0020', Level.LEVEL2, () => {
      let value: string = res.getLocales(false).toString();
      console.log('SUB_GLOBAL_GetLocales_0020:' + value);
      expect(value == 'en-US,zh-CN').assertTrue();
    })

    /**
     * @tc.number   : getStringSync_test_1400
     * @tc.name     : getStringSync_test_1400
     * @tc.desc     : errcode 9001007 with array
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_test_1400', Level.LEVEL3, () => {
      try {
        res.getStringSync($r('app.string.test_stringTwentyThree').id, 'test', 0)
      } catch (err) {
        console.log('getStringSync_test_1400 error code:' + err.code);
        expect(err.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.number   : isRawDir_test_0100
     * @tc.name     : isRawDir_test_0100
     * @tc.desc     : errcode 9001005
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('isRawDir_test_0100', Level.LEVEL3, () => {
      try {
        res.isRawDir('invalidPath');
      } catch (err) {
        console.log('isRawDir_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001005');
      }
    })
    console.log('*************end globalStageTest*************');
  })
}