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
import application from '@ohos.app.ability.application';

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
     * @tc.name   getStringSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETSTRINGSYNC_STAGE_0100
     * @tc.desc   getStringSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getStringSync_stagetest_0100', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   getStringSync_stagetest_0200
     * @tc.number SUB_GLOBAL_GETSTRINGSYNC_STAGE_0200
     * @tc.desc   getStringSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringSync_stagetest_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getStringByNameSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETSTRINGBYNAME_STAGE_0100
     * @tc.desc   getStringByNameSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringByNameSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: string = res.getStringByNameSync('app_name');
      console.log('getStringByNameSync_stagetest_0100 1' + value);
      expect(value).assertEqual('ohosProject %d');
      done();
    })

    /**
     * @tc.name   getStringByNameSync_stagetest_0200
     * @tc.number SUB_GLOBAL_GETSTRINGBYNAME_STAGE_0200
     * @tc.desc   getStringByNameSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getStringByNameSync_stagetest_0200', Level.LEVEL2, async (done: Function) => {
      let value: string = res.getStringByNameSync('app_name', 100);
      console.log('getStringByNameSync_stagetest_0200 1' + value);
      expect(value).assertEqual('ohosProject 100');
      done();
    })

    /**
     * @tc.name   getStringValue_stage_test_0100
     * @tc.number SUB_GLOBAL_GETSTRINGVALUE_STAGE_0100
     * @tc.desc   getStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getStringValue_stage_test_0100', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   getStringValue_stage_test_0200
     * @tc.number SUB_GLOBAL_GETSTRINGVALUE_STAGE_0200
     * @tc.desc   getStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getStringValue_stage_test_0200', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   getStringArrayValue_stage_test_0100
     * @tc.number SUB_GLOBAL_GETSTRINGARRAYVALUE_STAGE_0100
     * @tc.desc   getStringArrayValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getStringArrayValue_stage_test_0100', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   getStringArrayValue_stage_test_0200
     * @tc.number SUB_GLOBAL_GETSTRINGARRAYVALUE_STAGE_0200
     * @tc.desc   getStringArrayValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getStringArrayValue_stage_test_0200', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   getMediaContent_stage_test_0100
     * @tc.number SUB_GLOBAL_GETMEDIACONTENT_STAGE_0100
     * @tc.desc   getMediaContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContent_stage_test_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getMediaContent_stage_test_0200
     * @tc.number SUB_GLOBAL_GETMEDIACONTENT_STAGE_0200
     * @tc.desc   getMediaContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContent_stage_test_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getMediaContent_stage_test_0300
     * @tc.number SUB_GLOBAL_GETMEDIACONTENT_STAGE_0300
     * @tc.desc   getMediaContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaContent_stage_test_0300', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   getMediaContent_stage_test_0400
     * @tc.number SUB_GLOBAL_GETMEDIACONTENT_STAGE_0400
     * @tc.desc   getMediaContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaContent_stage_test_0400', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   getMediaContentBase64_stage_test_0100
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0100
     * @tc.desc   getMediaContentBase64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentBase64_stage_test_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getMediaContentBase64_stage_test_0200
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0200
     * @tc.desc   getMediaContentBase64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentBase64_stage_test_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getMediaContentBase64_stage_test_0300
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0300
     * @tc.desc   getMediaContentBase64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentBase64_stage_test_0300', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getMediaContentBase64_stage_test_0400
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0400
     * @tc.desc   getMediaContentBase64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentBase64_stage_test_0400', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getPluralStringValue_stage_test_0100
     * @tc.number SUB_GLOBAL_GETPLURALSTRINGVALUE_STAGE_0100
     * @tc.desc   getPluralStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPluralStringValue_stage_test_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getPluralStringValue_stage_test_0200
     * @tc.number SUB_GLOBAL_GETPLURALSTRINGVALUE_STAGE_0200
     * @tc.desc   getPluralStringValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPluralStringValue_stage_test_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getBoolean_stage_test_0100
     * @tc.number SUB_GLOBAL_GETBOOLEAN_STAGE_0100
     * @tc.desc   getBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBoolean_stage_test_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getNumber_stage_test_0100
     * @tc.number SUB_GLOBAL_GETNUMBER_STAGE_0100
     * @tc.desc   getNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getNumber_stage_test_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getDrawableDescriptor_stage_test_0100
     * @tc.number SUB_GLOBAL_GETDRAWABLEDESCRIPTOR_STAGE_0100
     * @tc.desc   getDrawableDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDrawableDescriptor_stage_test_0100', Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   getColor_test_0100
     * @tc.number SUB_GLOBAL_GETCOLOR_STAGE_JS_0100
     * @tc.desc   get the color in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColor_test_0100', Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   getColor_test_0200
     * @tc.number SUB_GLOBAL_GETCOLOR_STAGE_JS_0200
     * @tc.desc   get the color in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColor_test_0200', Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   getColorSync_test_0100
     * @tc.number SUB_GLOBAL_GETCOLORSYNC_STAGE_JS_0100
     * @tc.desc   get the sync color in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSync_test_0100', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getRawFdSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETRAWFDSYNC_STAGE_0100
     * @tc.desc   getRawFdSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getRawFdSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: resourceManager.RawFileDescriptor = res.getRawFdSync('rawfiletest.xml');
      console.log('getRawFdSync_stagetest_0100 1' + value.fd);
      console.log('getRawFdSync_stagetest_0100 1' + value.offset);
      expect(value !== null).assertTrue();
      res.closeRawFdSync('rawfiletest.xml');
      done();
    })

    /**
     * @tc.name   getRawFileListSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETRAWFILELISTSYNC_STAGE_0100
     * @tc.desc   getRawFileListSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getRawFileListSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: Array<string> = res.getRawFileListSync('');
      console.log('getRawFileListSync_stagetest_0100 1' + value);
      console.log('getRawFileListSync_stagetest_0100 1' + value.length);
      expect(value.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   getRawFileContentSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETRAWFILECONTENTSYNC_STAGE_0100
     * @tc.desc   getRawFileContentSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getRawFileContentSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: Uint8Array =
      res.getRawFileContentSync('rawfiletest.xml');
      console.log('getRawFileContentSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getMediaContentSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTSYNC_STAGE_0100
     * @tc.desc   getMediaContentSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: Uint8Array = res.getMediaContentSync($r('app.media.icon').id);
      console.log('getMediaContentSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getMediaContentSync_stagetest_0200
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTSYNC_STAGE_0200
     * @tc.desc   getMediaContentSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentSync_stagetest_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getMediaContentBase64Sync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTBASE64SYNC_STAGE_0100
     * @tc.desc   getMediaContentBase64Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentBase64Sync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: string = res.getMediaContentBase64Sync($r('app.media.icon').id);
      console.log('getMediaContentBase64Sync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getMediaContentBase64Sync_stagetest_0200
     * @tc.number SUB_GLOBAL_GETMEDIACONTENTBASE64SYNC_STAGE_0200
     * @tc.desc   getMediaContentBase64Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaContentBase64Sync_stagetest_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getPluralStringValueSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETPLURALSTRINGVALUESYNC_STAGE_0100
     * @tc.desc   getPluralStringValueSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPluralStringValueSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: string = res.getPluralStringValueSync($r('app.plural.plural_name').id, 0);
      console.log('getPluralStringValueSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getPluralStringValueSync_stagetest_0200
     * @tc.number SUB_GLOBAL_GETPLURALSTRINGVALUESYNC_STAGE_0200
     * @tc.desc   getPluralStringValueSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPluralStringValueSync_stagetest_0200', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   getStringArrayValueSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETSTRINGARRAYVALUESYNC_STAGE_0100
     * @tc.desc   getStringArrayValueSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringArrayValueSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: Array<string> = res.getStringArrayValueSync($r('app.strarray.sizeList').id);
      console.log('getStringArrayValueSync_stagetest_0100 1' + value);
      expect(value.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   getStringArrayValueSync_stagetest_0200
     * @tc.number SUB_GLOBAL_GETSTRINGARRAYVALUESYNC_STAGE_0200
     * @tc.desc   getStringArrayValueSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringArrayValueSync_stagetest_0200', Level.LEVEL0, async (done: Function) => {
      let value: Array<string> = res.getStringArrayValueSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.strarray.sizeList').id
      });
      console.log('getStringArrayValueSync_stagetest_0200 1' + value);
      expect(value.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   getPluralStringByNameSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETPLURALSTRINGBYNAMESYNC_STAGE_0100
     * @tc.desc   getPluralStringByNameSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPluralStringByNameSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: string = res.getPluralStringByNameSync('plural_name', 2);
      console.log('getPluralStringByNameSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getMediaByNameSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETMEDIABYNAMESYNC_STAGE_0100
     * @tc.desc   getMediaByNameSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaByNameSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: Uint8Array = res.getMediaByNameSync('icon');
      console.log('getMediaByNameSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getMediaBase64ByNameSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETMEDIABASE64BYNAMESYNC_STAGE_0100
     * @tc.desc   getMediaBase64ByNameSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getMediaBase64ByNameSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: string = res.getMediaBase64ByNameSync('icon');
      console.log('getMediaBase64ByNameSync_stagetest_0100 1' + value);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getStringArrayByNameSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETSTRINGARRAYBYNAMESYNC_STAGE_0100
     * @tc.desc   getStringArrayByNameSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getStringArrayByNameSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: Array<string> = res.getStringArrayByNameSync('sizeList');
      console.log('getStringArrayByNameSync_stagetest_0100 1' + value);
      expect(value.length > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   getConfigurationSync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETCONFIGURATIONSYNC_STAGE_0100
     * @tc.desc   getConfigurationSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getConfigurationSync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: resourceManager.Configuration = res.getConfigurationSync();
      console.log('getStringArrayByNameSync_stagetest_0100 1' + value.locale);
      console.log('getStringArrayByNameSync_stagetest_0100 1' + value.direction);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   getDeviceCapabilitySync_stagetest_0100
     * @tc.number SUB_GLOBAL_GETDEVICECAPABILITYSYNC_STAGE_0100
     * @tc.desc   getDeviceCapabilitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDeviceCapabilitySync_stagetest_0100', Level.LEVEL0, async (done: Function) => {
      let value: resourceManager.DeviceCapability = res.getDeviceCapabilitySync();
      console.log('getDeviceCapabilitySync_stagetest_0100 1' + value.screenDensity);
      console.log('getDeviceCapabilitySync_stagetest_0100 1' + value.deviceType);
      expect(value !== null).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_GetLocales_0010
     * @tc.number SUB_GLOBAL_GetLocales_0010
     * @tc.desc   getLocales
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_GetLocales_0010', Level.LEVEL2, async (done: Function) => {
      let value: Array<string> = res.getLocales();
      console.log('SUB_GLOBAL_GetLocales_0010' + value);
      expect(value.length).assertLarger(0);
      expect(value.toString() == 'en-US,zh-CN').assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_GetSymbol_0010
     * @tc.number SUB_GLOBAL_getSymbol_0010
     * @tc.desc   getSymbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_GLOBAL_GetSymbol_0010', Level.LEVEL3, async (done: Function) => {
      let value: number = res.getSymbol($r('app.symbol.symbolTest1').id);
      console.log('SUB_GLOBAL_Getsymbol_0010_value' + value);
      expect(value == 983043).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_GetSymbol_0130
     * @tc.number SUB_GLOBAL_getSymbol_0130
     * @tc.desc   getSymbolByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GLOBAL_GetSymbol_0130', Level.LEVEL0, async (done: Function) => {
      let value: number = res.getSymbolByName('symbolTest1');
      console.log('SUB_GLOBAL_Getsymbol_0130' + value);
      expect(value == 983043).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_isRawDir_0010
     * @tc.number SUB_GOLBAL_REMSGR_isRawDir_0010
     * @tc.desc   SUB_GOLBAL_REMSGR_isRawDir_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_isRawDir_0010', Level.LEVEL0, async () => {
      let value: boolean = res.isRawDir('rawfiletest.xml');
      console.log('SUB_GOLBAL_REMSGR_isRawDir_0010_value' + value);
      expect(value == false).assertTrue();
    })

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010
     * @tc.desc   SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010', Level.LEVEL0, async () => {
      let value: resourceManager.Configuration = res.getOverrideConfiguration();
      console.log('SUB_GOLBAL_REMSGR_getOverrideConfiguration_0010_value' + value.mnc);
      expect(value.mnc == 0).assertTrue();
    })

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010
     * @tc.number SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010
     * @tc.desc   SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_getOverrideResourceManager_0010', Level.LEVEL0, async () => {
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

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010
     * @tc.number SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010
     * @tc.desc   SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_updateOverrideConfiguration_0010', Level.LEVEL0, async () => {
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

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_resourceToSendableResource_0010
     * @tc.number SUB_GOLBAL_REMSGR_resourceToSendableResource_0010
     * @tc.desc   SUB_GOLBAL_REMSGR_resourceToSendableResource_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_resourceToSendableResource_0010', Level.LEVEL0, async () => {
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

    /**
     * @tc.name   SUB_GOLBAL_REMSGR_sendableResourceToResource_0010
     * @tc.number SUB_GOLBAL_REMSGR_sendableResourceToResource_0010
     * @tc.desc   SUB_GOLBAL_REMSGR_sendableResourceToResource_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_GOLBAL_REMSGR_sendableResourceToResource_0010', Level.LEVEL0, async () => {
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
     * @tc.name   resourceManager_test_getStringSync_0010
     * @tc.number SUB_GLOBAL_FormatStringIndex_0100
     * @tc.desc   %2$d(The second parameter is an integer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0010', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0020
     * @tc.number SUB_GLOBAL_FormatStringIndex_0200
     * @tc.desc   %2$d(The second parameter is an integer in scientific notation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0020', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0030
     * @tc.number SUB_GLOBAL_FormatStringIndex_0300
     * @tc.desc   %2$d(The second parameter is a decimal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0030', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0040
     * @tc.number SUB_GLOBAL_FormatStringIndex_0400
     * @tc.desc   %2$d(The second parameter is a decimal number in scientific notation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0040', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0050
     * @tc.number SUB_GLOBAL_FormatStringIndex_0500
     * @tc.desc   %3$s(The third parameter is a Chinese string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0050', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0060
     * @tc.number SUB_GLOBAL_FormatStringIndex_0600
     * @tc.desc   %3$s(The third parameter is an English string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0060', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0070
     * @tc.number SUB_GLOBAL_FormatStringIndex_0700
     * @tc.desc   %4$f(The fourth parameter is an integer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0070', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0080
     * @tc.number SUB_GLOBAL_FormatStringIndex_0800
     * @tc.desc   %4$f(The fourth parameter is an integer in scientific notation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0080', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0090
     * @tc.number SUB_GLOBAL_FormatStringIndex_0900
     * @tc.desc   %4$f(The fourth parameter is a decimal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0090', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0100
     * @tc.number SUB_GLOBAL_FormatStringIndex_1000
     * @tc.desc   %4$f(The fourth parameter is a decimal number in scientific notation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0100', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0110
     * @tc.number SUB_GLOBAL_FormatStringIndex_1100
     * @tc.desc   %%d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0110', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0120
     * @tc.number SUB_GLOBAL_FormatStringIndex_1200
     * @tc.desc   %%%s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0120', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0130
     * @tc.number SUB_GLOBAL_FormatStringIndex_1300
     * @tc.desc   %%%%f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0130', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0140
     * @tc.number SUB_GLOBAL_FormatStringIndex_1400
     * @tc.desc   %2$d %3$s %4$f(The second parameter is integer, the third is Chinese, the fourth is decimal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0140', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0150
     * @tc.number SUB_GLOBAL_FormatStringIndex_1500
     * @tc.desc   %2$d %3$s %4$f(The second parameter is integer in scientific notation,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0150', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0160
     * @tc.number SUB_GLOBAL_FormatStringIndex_1600
     * @tc.desc   %2$d %3$s %4$f %%d(The parameter is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0160', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0170
     * @tc.number SUB_GLOBAL_FormatStringIndex_1700
     * @tc.desc   %d %1$d(The parameter is null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0170', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0180
     * @tc.number SUB_GLOBAL_FormatStringIndex_1800
     * @tc.desc   %2$d %3$s %4$f(There are more parameters than placeholder indexes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0180', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0190
     * @tc.number SUB_GLOBAL_FormatStringIndex_1900
     * @tc.desc   %d %1$d(Inconsistent placeholder styles)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0190', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0200
     * @tc.number SUB_GLOBAL_FormatStringIndex_2000
     * @tc.desc   %%%d %1$d(Inconsistent placeholder styles)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0200', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0210
     * @tc.number SUB_GLOBAL_FormatStringIndex_2100
     * @tc.desc   %d %d %s %s %f %f(Arguments and placeholder match and equal in number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0210', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0220
     * @tc.number SUB_GLOBAL_FormatStringIndex_2200
     * @tc.desc   %d %d %s %s %f %f(The parameters is more than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getStringSync_0220', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getStringSync_0230
     * @tc.number SUB_GLOBAL_FormatStringIndex_2300
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_0230', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyThree').id);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0230' + error.code + error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_0240
     * @tc.number SUB_GLOBAL_FormatStringIndex_2400
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_0240', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getStringByNameSync_0250
     * @tc.number SUB_GLOBAL_FormatStringIndex_2500
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringByNameSync_0250', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyThree');
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0250' + error.code + error.message);
        expect(error.code).assertEqual(9001008);
      }
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_0260
     * @tc.number SUB_GLOBAL_FormatStringIndex_2600
     * @tc.desc   The wrong parameter type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_0260', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyFour').id, "format string", "format", "1.5", "string");
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0260' + error.code + error.message);
        expect(error.code).assertEqual('9001007');
      }
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_0270
     * @tc.number SUB_GLOBAL_FormatStringIndex_2700
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_0270', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getStringByNameSync_0280
     * @tc.number SUB_GLOBAL_FormatStringIndex_2800
     * @tc.desc   Parameter out of index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringByNameSync_0280', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyFour', "format string", "format", "1.5", "string");
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0280' + error.code + error.message);
        expect(error.code).assertEqual('9001008');
      }
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_0290
     * @tc.number SUB_GLOBAL_FormatStringIndex_2900
     * @tc.desc   Parameters less than required
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_0290', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringSync($r('app.string.test_stringTwentyFive').id);
      } catch (error) {
        console.log('resourceManager_test_getStringSync_0290' + error.code + error.message);
        expect(error.code).assertEqual(9001007);
      }
    })

    /**
     * @tc.name   resourceManager_test_getStringSync_0300
     * @tc.number SUB_GLOBAL_FormatStringIndex_3000
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringSync_0300', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getStringByNameSync_0310
     * @tc.number SUB_GLOBAL_FormatStringIndex_3100
     * @tc.desc   %2$d %3$s %4$f(Get failed because of parameters is less than required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getStringByNameSync_0310', Level.LEVEL3, () => {
      let resMgr = res;
      try {
        resMgr.getStringByNameSync('test_stringTwentyFive');
      } catch (error) {
        console.log('resourceManager_test_getStringByNameSync_0310' + error.code + error.message);
        expect(error.code).assertEqual(9001008);
      }
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_0020
     * @tc.number SUB_GLOBAL_getSymbol_0020
     * @tc.desc   getSymbol resource by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_0020', Level.LEVEL2, () => {
      let value = res.getSymbol($r('app.symbol.symbolTestReference').id);
      console.log('resourceManager_test_getSymbol_0020:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_0040
     * @tc.number SUB_GLOBAL_getSymbol_0040
     * @tc.desc   getSymbol resource resId invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_0040', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0050
     * @tc.number SUB_GLOBAL_getSymbol_0050
     * @tc.desc   getSymbol resource resId invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_0050', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0060
     * @tc.number SUB_GLOBAL_getSymbol_0060
     * @tc.desc   getSymbol resource resource re-ref too much by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_0060', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0070
     * @tc.number SUB_GLOBAL_getSymbol_0070
     * @tc.desc   getSymbol normal resource object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_0070', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0080
     * @tc.number SUB_GLOBAL_getSymbol_0080
     * @tc.desc   getSymbol normal reference resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_0080', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0100
     * @tc.number SUB_GLOBAL_getSymbol_0100
     * @tc.desc   getSymbol resId invalid by resource object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_0100', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0110
     * @tc.number SUB_GLOBAL_getSymbol_0110
     * @tc.desc   getSymbol resource not found by resource object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_0110', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0120
     * @tc.number SUB_GLOBAL_getSymbol_0120
     * @tc.desc   getSymbol resource re-ref too much by resource object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_0120', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0140
     * @tc.number SUB_GLOBAL_getSymbol_0140
     * @tc.desc   getSymbolByName reference resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_0140', Level.LEVEL2, () => {
      let value = res.getSymbolByName('symbolTestReference');
      console.log('resourceManager_test_getSymbol_0140:' + value);
      expect(value == 983043).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_0160
     * @tc.number SUB_GLOBAL_getSymbol_0160
     * @tc.desc   getSymbolByName resName invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_0160', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0180
     * @tc.number SUB_GLOBAL_getSymbol_0180
     * @tc.desc   getSymbolByName resource re-ref too much
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getSymbol_0180', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0190
     * @tc.number SUB_GLOBAL_getSymbol_0190
     * @tc.desc   getSymbol normal resource by resId in Chinese
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_0190', Level.LEVEL2, () => {
      let value = res.getSymbol($r('app.symbol.symbolTest2').id);
      console.log('resourceManager_test_getSymbol_0190:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getSymbol_0200
     * @tc.number SUB_GLOBAL_getSymbol_0200
     * @tc.desc   getSymbol normal resource by resId in Chinese
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_0200', Level.LEVEL2, () => {
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
     * @tc.name   resourceManager_test_getSymbol_0210
     * @tc.number SUB_GLOBAL_getSymbol_0210
     * @tc.desc   getSymbolByName normal name ZH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getSymbol_0210', Level.LEVEL2, () => {
      let value = res.getSymbolByName('symbolTest2');
      console.log('resourceManager_test_getSymbol_0210:' + value);
      expect(value == 983041).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getDrawable_1400
     * @tc.number SUB_GLOBAL_I18N_getDrawable_1400
     * @tc.desc   getDrawableDescriptor with resource Object not exist resource id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDrawable_1400', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getDrawable_0900
     * @tc.number SUB_GLOBAL_I18N_getDrawable_0900
     * @tc.desc   getDrawableDescriptorByName with not exist pic name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getDrawable_0900', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getRawFdSync_0020
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0020
     * @tc.desc   getRawFdSync with subdirectory non-empty file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getRawFdSync_0020', Level.LEVEL2, () => {
      let value = res.getRawFdSync('A/test.txt');
      console.log('resourceManager_test_getRawFdSync_0020_fd' + value.fd);
      console.log('resourceManager_test_getRawFdSync_0020_offset' + value.offset);
      console.log('resourceManager_test_getRawFdSync_0020_length' + value.length);
      expect(value != null && value.length == 4).assertTrue();
      res.closeRawFdSync('A/test.txt');
    })

    /**
     * @tc.name   resourceManager_test_getRawFdSync_0030
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0030
     * @tc.desc   getRawFdSync with subdirectory empty file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getRawFdSync_0030', Level.LEVEL2, () => {
      let value = res.getRawFdSync('A/none.xml');
      console.log('resourceManager_test_getRawFdSync_0030_fd' + value.fd);
      console.log('resourceManager_test_getRawFdSync_0030_offset' + value.offset);
      console.log('resourceManager_test_getRawFdSync_0030_length' + value.length);
      expect(value != null && value.length == 0).assertTrue();
      res.closeRawFdSync('A/none.xml');
    })

    /**
     * @tc.name   resourceManager_test_getRawFdSync_0050
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0050
     * @tc.desc   getRawFdSync with error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getRawFdSync_0050', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getRawFileContentSync_0170
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0170
     * @tc.desc   getRawFileContentSync with subdirectory empty file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getRawFileContentSync_0170', Level.LEVEL2, () => {
      let value = res.getRawFileContentSync('A/none.xml');
      console.log('resourceManager_test_getRawFileContentSync_0170:' + value);
      expect(value.length == 0).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getRawFileContentSync_0160
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0160
     * @tc.desc   getRawFileContentSync with subdirectory non-empty file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getRawFileContentSync_0160', Level.LEVEL2, () => {
      let value = res.getRawFileContentSync('A/test.txt');
      console.log('resourceManager_test_getRawFileContentSync_0160:' + value);
      expect(value.length == 4).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getRawFileContentSync_0190
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0190
     * @tc.desc   getRawFileContentSync with error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getRawFileContentSync_0190', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_getRawFileListSync_0120
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0120
     * @tc.desc   getRawFileListSync with subdirectory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('resourceManager_test_getRawFileListSync_0120', Level.LEVEL2, () => {
      let value = res.getRawFileListSync('A');
      console.log('resourceManager_test_getRawFileListSync_0120:' + value);
      expect(value.length >= 102).assertTrue();
    })

    /**
     * @tc.name   resourceManager_test_getRawFileListSync_0140
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0140
     * @tc.desc   getRawFileListSync with error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_getRawFileListSync_0140', Level.LEVEL3, () => {
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
     * @tc.name   resourceManager_test_closeRawFdSync_0100
     * @tc.number SUB_GLOBAL_I18N_RawFileSync_0100
     * @tc.desc   closeRawFdSync with error path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('resourceManager_test_closeRawFdSync_0100', Level.LEVEL3, () => {
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
     * @tc.name   getStringArrayValue_stage_test_0300
     * @tc.number getStringArrayValue_stage_test_0300
     * @tc.desc   errcode 9001001 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_0400
     * @tc.number getStringArrayValue_stage_test_0400
     * @tc.desc   errcode 9001002 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_0500
     * @tc.number getStringArrayValue_stage_test_0500
     * @tc.desc   errcode 9001006 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_0600
     * @tc.number getStringArrayValue_stage_test_0600
     * @tc.desc   errcode 401 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_0700
     * @tc.number getStringArrayValue_stage_test_0700
     * @tc.desc   errcode 9001001 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_0800
     * @tc.number getStringArrayValue_stage_test_0800
     * @tc.desc   errcode 9001002 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_0900
     * @tc.number getStringArrayValue_stage_test_0900
     * @tc.desc   errcode 9001006 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_1000
     * @tc.number getStringArrayValue_stage_test_1000
     * @tc.desc   errcode 401 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_0500
     * @tc.number getMediaContent_stage_test_0500
     * @tc.desc   errcode 9001001 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_0600
     * @tc.number getMediaContent_stage_test_0600
     * @tc.desc   errcode 9001002 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_0700
     * @tc.number getMediaContent_stage_test_0700
     * @tc.desc   errcode 401 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_0800
     * @tc.number getMediaContent_stage_test_0800
     * @tc.desc   errcode 9001001 in callback mode with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_0900
     * @tc.number getMediaContent_stage_test_0900
     * @tc.desc   errcode 9001002 in callback mode with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_1000
     * @tc.number getMediaContent_stage_test_1000
     * @tc.desc   errcode 401 in callback mode with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_1100
     * @tc.number getMediaContent_stage_test_1100
     * @tc.desc   errcode 9001001 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_1200
     * @tc.number getMediaContent_stage_test_1200
     * @tc.desc   errcode 9001002 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_1300
     * @tc.number getMediaContent_stage_test_1300
     * @tc.desc   errcode 401 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_1400
     * @tc.number getMediaContent_stage_test_1400
     * @tc.desc   errcode 9001001 in promise mode with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_1500
     * @tc.number getMediaContent_stage_test_1500
     * @tc.desc   errcode 9001002 in promise mode with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_1600
     * @tc.number getMediaContent_stage_test_1600
     * @tc.desc   errcode 401 in promise mode with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringValue_stage_test_0300
     * @tc.number getStringValue_stage_test_0300
     * @tc.desc   errcode 401 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_1100
     * @tc.number getStringArrayValue_stage_test_1100
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_1100', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue(0x01234567, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_1200
     * @tc.number getStringArrayValue_stage_test_1200
     * @tc.desc   errcode 9001002 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_1200', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue($r('app.string.module_test_desc').id, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_1300
     * @tc.number getStringArrayValue_stage_test_1300
     * @tc.desc   errcode 9001006 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayValue_stage_test_1300', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayValue($r('app.strarray.sizeListThree').id, (err: BusinessError) => {
        console.log('getStringArrayValue_stage_test_1300 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayValue_stage_test_1400
     * @tc.number getStringArrayValue_stage_test_1400
     * @tc.desc   errcode 9001001 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_1500
     * @tc.number getStringArrayValue_stage_test_1500
     * @tc.desc   errcode 9001002 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValue_stage_test_1600
     * @tc.number getStringArrayValue_stage_test_1600
     * @tc.desc   errcode 9001006 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_1700
     * @tc.number getMediaContent_stage_test_1700
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_1700', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent(0x01234567, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_1700 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_1800
     * @tc.number getMediaContent_stage_test_1800
     * @tc.desc   errcode 9001002 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_1800', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent($r('app.string.module_test_desc').id, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_1800 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_1900
     * @tc.number getMediaContent_stage_test_1900
     * @tc.desc   errcode 9001001 in callback mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_1900', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent(0x01234567, 0, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_1900 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_2000
     * @tc.number getMediaContent_stage_test_2000
     * @tc.desc   errcode 9001002 in callback mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContent_stage_test_2000', Level.LEVEL3, async (done: Function) => {
      res.getMediaContent($r('app.string.module_test_desc').id, 0, (err: BusinessError) => {
        console.log('getMediaContent_stage_test_2000 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContent_stage_test_2100
     * @tc.number getMediaContent_stage_test_2100
     * @tc.desc   errcode 9001001 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_2200
     * @tc.number getMediaContent_stage_test_2200
     * @tc.desc   errcode 9001002 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_2300
     * @tc.number getMediaContent_stage_test_2300
     * @tc.desc   errcode 9001001 in promise mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContent_stage_test_2400
     * @tc.number getMediaContent_stage_test_2400
     * @tc.desc   errcode 9001002 in promise mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_0500
     * @tc.number getMediaContentBase64_stage_test_0500
     * @tc.desc   errcode 9001001 in callback mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_0600
     * @tc.number getMediaContentBase64_stage_test_0600
     * @tc.desc   errcode 9001002 in callback mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_0700
     * @tc.number getMediaContentBase64_stage_test_0700
     * @tc.desc   errcode 401 in callback mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_0800
     * @tc.number getMediaContentBase64_stage_test_0800
     * @tc.desc   errcode 9001001 in callback mode with density by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_0900
     * @tc.number getMediaContentBase64_stage_test_0900
     * @tc.desc   errcode 9001002 in callback mode with density by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_1000
     * @tc.number getMediaContentBase64_stage_test_1000
     * @tc.desc   errcode 401 in callback mode with density by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_1100
     * @tc.number getMediaContentBase64_stage_test_1100
     * @tc.desc   errcode 9001001 in promise mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_1200
     * @tc.number getMediaContentBase64_stage_test_1200
     * @tc.desc   errcode 9001002 in promise mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_1300
     * @tc.number getMediaContentBase64_stage_test_1300
     * @tc.desc   errcode 401 in promise mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_1400
     * @tc.number getMediaContentBase64_stage_test_1400
     * @tc.desc   errcode 9001001 in promise mode by resObject with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_1500
     * @tc.number getMediaContentBase64_stage_test_1500
     * @tc.desc   errcode 9001002 in promise mode by resObject with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_1600
     * @tc.number getMediaContentBase64_stage_test_1600
     * @tc.desc   errcode 401 in promise mode by resObject with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_1700
     * @tc.number getMediaContentBase64_stage_test_1700
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_1700', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64(0x01234567, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1600 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_1800
     * @tc.number getMediaContentBase64_stage_test_1800
     * @tc.desc   errcode 9001002 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_1800', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64($r('app.string.test_stringTwo').id, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1600 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_1900
     * @tc.number getMediaContentBase64_stage_test_1900
     * @tc.desc   errcode 9001001 in callback mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_1900', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64(0x01234567, 0, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_1900 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })


    /**
     * @tc.name   getMediaContentBase64_stage_test_2000
     * @tc.number getMediaContentBase64_stage_test_2000
     * @tc.desc   errcode 9001002 in callback mode with density by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaContentBase64_stage_test_2000', Level.LEVEL3, async (done: Function) => {
      res.getMediaContentBase64($r('app.string.test_stringTwo').id, 0, (err: BusinessError) => {
        console.log('getMediaContentBase64_stage_test_2000 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getMediaContentBase64_stage_test_2100
     * @tc.number getMediaContentBase64_stage_test_2100
     * @tc.desc   errcode 9001001 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_2200
     * @tc.number getMediaContentBase64_stage_test_2200
     * @tc.desc   errcode 9001002 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_2300
     * @tc.number getMediaContentBase64_stage_test_2300
     * @tc.desc   errcode 9001001 in promise mode by resId with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64_stage_test_2400
     * @tc.number getMediaContentBase64_stage_test_2400
     * @tc.desc   errcode 9001002 in promise mode by resId with density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_0300
     * @tc.number getPluralStringValue_stage_test_0300
     * @tc.desc   getPluralStringValue_stage_test_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_0400
     * @tc.number getPluralStringValue_stage_test_0400
     * @tc.desc   getPluralStringValue_stage_test_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_0500
     * @tc.number getPluralStringValue_stage_test_0500
     * @tc.desc   errcode 9001006 in callback mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_0600
     * @tc.number getPluralStringValue_stage_test_0600
     * @tc.desc   errcode 401 in callback mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_0700
     * @tc.number getPluralStringValue_stage_test_0700
     * @tc.desc   errcode 9001001 in promise mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_0800
     * @tc.number getPluralStringValue_stage_test_0800
     * @tc.desc   errcode 9001002 in promise mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_0900
     * @tc.number getPluralStringValue_stage_test_0900
     * @tc.desc   errcode 9001006 in promise mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_1000
     * @tc.number getPluralStringValue_stage_test_1000
     * @tc.desc   errcode 401 in promise mode by resObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_1100
     * @tc.number getPluralStringValue_stage_test_1100
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getPluralStringValue_stage_test_1100', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue(0x01234567, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1100 error code:' + err.code);
        expect(err.code).assertEqual(9001001);
        done();
      })
    })

    /**
     * @tc.name   getPluralStringValue_stage_test_1200
     * @tc.number getPluralStringValue_stage_test_1200
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getPluralStringValue_stage_test_1200', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue($r('app.media.icon').id, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1200 error code:' + err.code);
        expect(err.code).assertEqual(9001002);
        done();
      })
    })

    /**
     * @tc.name   getPluralStringValue_stage_test_1300
     * @tc.number getPluralStringValue_stage_test_1300
     * @tc.desc   errcode 9001006 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getPluralStringValue_stage_test_1300', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue($r('app.plural.plural_name_loop').id, 2, (err: BusinessError) => {
        console.log('getPluralStringValue_stage_test_1300 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getPluralStringValue_stage_test_1400
     * @tc.number getPluralStringValue_stage_test_1400
     * @tc.desc   errcode 9001001 in callback mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_1500
     * @tc.number getPluralStringValue_stage_test_1500
     * @tc.desc   errcode 9001002 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValue_stage_test_1600
     * @tc.number getPluralStringValue_stage_test_1600
     * @tc.desc   errcode 9001006 in promise mode by resId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringByName_stage_test_0100
     * @tc.number getStringByName_stage_test_0100
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByName_stage_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getStringByName('', (err: BusinessError) => {
        console.log('getStringByName_stage_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getStringByName_stage_test_0200
     * @tc.number getStringByName_stage_test_0200
     * @tc.desc   errcode 9001006 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringByName_stage_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getStringByName('test_stringLoopA', (err: BusinessError) => {
        console.log('getStringByName_stage_test_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })


    /**
     * @tc.name   getStringByName_stage_test_0300
     * @tc.number getStringByName_stage_test_0300
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringByName_stage_test_0400
     * @tc.number getStringByName_stage_test_0400
     * @tc.desc   errcode 9001006 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayByName_stage_test_0100
     * @tc.number getStringArrayByName_stage_test_0100
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayByName_stage_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayByName('', (err: BusinessError) => {
        console.log('getStringArrayByName_stage_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayByName_stage_test_0200
     * @tc.number getStringArrayByName_stage_test_0200
     * @tc.desc   errcode 9001006 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getStringArrayByName_stage_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getStringArrayByName('sizeListThree', (err: BusinessError) => {
        console.log('getStringArrayByName_stage_test_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getStringArrayByName_stage_test_0300
     * @tc.number getStringArrayByName_stage_test_0300
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayByName_stage_test_0400
     * @tc.number getStringArrayByName_stage_test_0400
     * @tc.desc   errcode 9001006 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaByName_test_0300
     * @tc.number getMediaByName_test_0300
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaByName_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getMediaByName('', (err: BusinessError) => {
        console.log('getMediaByName_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaByName_test_0400
     * @tc.number getMediaByName_test_0400
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaByName_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getMediaByName('', 0, (err: BusinessError) => {
        console.log('getMediaByName_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaByName_test_0500
     * @tc.number getMediaByName_test_0500
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaByName_test_0600
     * @tc.number getMediaByName_test_0600
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaBase64ByName_test_0300
     * @tc.number getMediaBase64ByName_test_0300
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaBase64ByName_test_0300', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64ByName('', (err: BusinessError) => {
        console.log('getMediaBase64ByName_test_0300 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaBase64ByName_test_0400
     * @tc.number getMediaBase64ByName_test_0400
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getMediaBase64ByName_test_0400', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64ByName('', 0, (err: BusinessError) => {
        console.log('getMediaBase64ByName_test_0400 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getMediaBase64ByName_test_0500
     * @tc.number getMediaBase64ByName_test_0500
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaBase64ByName_test_0600
     * @tc.number getMediaBase64ByName_test_0600
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringByName_test_0100
     * @tc.number getPluralStringByName_test_0100
     * @tc.desc   errcode 9001003 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getPluralStringByName_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringByName('', 0, (err: BusinessError) => {
        console.log('getPluralStringByName_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001003);
        done();
      })
    })

    /**
     * @tc.name   getPluralStringByName_test_0200
     * @tc.number getPluralStringByName_test_0200
     * @tc.desc   errcode 9001006 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getPluralStringByName_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringByName('plural_name_loop', 0, (err: BusinessError) => {
        console.log('getPluralStringByName_test_0200 error code:' + err.code);
        expect(err.code).assertEqual(9001006);
        done();
      })
    })

    /**
     * @tc.name   getPluralStringByName_test_0300
     * @tc.number getPluralStringByName_test_0300
     * @tc.desc   errcode 9001003 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringByName_test_0400
     * @tc.number getPluralStringByName_test_0400
     * @tc.desc   errcode 9001006 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0100
     * @tc.number getStringSync_test_0100
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0200
     * @tc.number getStringSync_test_0200
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0300
     * @tc.number getStringSync_test_0300
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0400
     * @tc.number getStringSync_test_0400
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0500
     * @tc.number getStringSync_test_0500
     * @tc.desc   errcode 9001007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0600
     * @tc.number getStringSync_test_0600
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0700
     * @tc.number getStringSync_test_0700
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0800
     * @tc.number getStringSync_test_0800
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_0900
     * @tc.number getStringSync_test_0900
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_1000
     * @tc.number getStringSync_test_1000
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_1100
     * @tc.number getStringSync_test_1100
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_1200
     * @tc.number getStringSync_test_1200
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringSync_test_1300
     * @tc.number getStringSync_test_1300
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringByNameSync_test_0100
     * @tc.number getStringByNameSync_test_0100
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringByNameSync_test_0300
     * @tc.number getStringByNameSync_test_0300
     * @tc.desc   errcode 9001003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringByNameSync_test_0400
     * @tc.number getStringByNameSync_test_0400
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getBoolean_test_0100
     * @tc.number getBoolean_test_0100
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getBoolean_test_0200
     * @tc.number getBoolean_test_0200
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getBoolean_test_0300
     * @tc.number getBoolean_test_0300
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getBoolean_test_0400
     * @tc.number getBoolean_test_0400
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getBoolean_test_0500
     * @tc.number getBoolean_test_0500
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getBoolean_test_0600
     * @tc.number getBoolean_test_0600
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getBooleanByName_test_0100
     * @tc.number getBooleanByName_test_0100
     * @tc.desc   errcode 9001003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getBooleanByName_test_0200
     * @tc.number getBooleanByName_test_0200
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getNumber_test_0100
     * @tc.number getNumber_test_0100
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getNumber_test_0200
     * @tc.number getNumber_test_0200
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getNumber_test_0300
     * @tc.number getNumber_test_0300
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getNumber_test_0400
     * @tc.number getNumber_test_0400
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getNumber_test_0500
     * @tc.number getNumber_test_0500
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getNumber_test_0600
     * @tc.number getNumber_test_0600
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getNumberByName_test_0100
     * @tc.number getNumberByName_test_0100
     * @tc.desc   errcode 9001003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getNumberByName_test_0200
     * @tc.number getNumberByName_test_0200
     * @tc.desc   errcode 9001006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getRawFileContent_test_0100
     * @tc.number getRawFileContent_test_0100
     * @tc.desc   errcode 9001005 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getRawFileContent_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getRawFileContent('plural_name_loop', (err: BusinessError) => {
        console.log('getRawFileContent_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001005);
        done();
      })
    })

    /**
     * @tc.name   getRawFileContent_test_0200
     * @tc.number getRawFileContent_test_0200
     * @tc.desc   errcode 9001005 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getRawFd_test_0100
     * @tc.number getRawFd_test_0100
     * @tc.desc   errcode 9001005 in callback mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getRawFd_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getRawFd('plural_name_loop', (err: BusinessError) => {
        console.log('getRawFd_test_0100 error code:' + err.code);
        expect(err.code).assertEqual(9001005);
        done();
      })
    })

    /**
     * @tc.name   getRawFd_test_0200
     * @tc.number getRawFd_test_0200
     * @tc.desc   errcode 9001005 in promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_0200
     * @tc.number getDrawableDescriptor_stage_test_0200
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_0300
     * @tc.number getDrawableDescriptor_stage_test_0300
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_0400
     * @tc.number getDrawableDescriptor_stage_test_0400
     * @tc.desc   errcode 9001001 debsity?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_0500
     * @tc.number getDrawableDescriptor_stage_test_0500
     * @tc.desc   errcode 9001002 density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_0600
     * @tc.number getDrawableDescriptor_stage_test_0600
     * @tc.desc   errcode 9001001 density? type?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_0700
     * @tc.number getDrawableDescriptor_stage_test_0700
     * @tc.desc   errcode 9001002 density? type?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_0800
     * @tc.number getDrawableDescriptor_stage_test_0800
     * @tc.desc   errcode 9001001 Resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_0900
     * @tc.number getDrawableDescriptor_stage_test_0900
     * @tc.desc   errcode 9001002 Resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_1000
     * @tc.number getDrawableDescriptor_stage_test_1000
     * @tc.desc   errcode 9001001 Resource density?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_1100
     * @tc.number getDrawableDescriptor_stage_test_1100
     * @tc.desc   errcode 9001002 Resource  debsity?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_1200
     * @tc.number getDrawableDescriptor_stage_test_1200
     * @tc.desc   errcode 9001001 Resource debsity? type?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptor_stage_test_1300
     * @tc.number getDrawableDescriptor_stage_test_1300
     * @tc.desc   errcode 9001002 Resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptorByName_test_0100
     * @tc.number getDrawableDescriptorByName_test_0100
     * @tc.desc   errcode 9001003 debsity? type?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getDrawableDescriptorByName_test_0200
     * @tc.number getDrawableDescriptorByName_test_0200
     * @tc.desc   errcode 9001003 debsity?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getRawFdSync_test_0100
     * @tc.number getRawFdSync_test_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   closeRawFdSync_test_0100
     * @tc.number closeRawFdSync_test_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getRawFileListSync_test_0100
     * @tc.number getRawFileListSync_test_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getRawFileContentSync_test_0100
     * @tc.number getRawFileContentSync_test_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentSync_test_0100
     * @tc.number getMediaContentSync_test_0100
     * @tc.desc   errcode 9001001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentSync_test_0200
     * @tc.number getMediaContentSync_test_0200
     * @tc.desc   errcode 9001002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentSync_test_0300
     * @tc.number getMediaContentSync_test_0300
     * @tc.desc   errcode 9001001 Resource density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentSync_test_0400
     * @tc.number getMediaContentSync_test_0400
     * @tc.desc   errcode 9001002 Resource density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentSync_test_0500
     * @tc.number getMediaContentSync_test_0500
     * @tc.desc   getMediaContentSync with res id density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaContentSync_test_0500', Level.LEVEL2, () => {
      let value: Uint8Array = res.getMediaContentSync($r('app.media.icon').id, 0);
      console.log('getMediaContentSync_test_0500 1' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaContentSync_test_0600
     * @tc.number getMediaContentSync_test_0600
     * @tc.desc   getMediaContentSync with resource object density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaContentSync_test_0600', Level.LEVEL2, () => {
      let value: Uint8Array = res.getMediaContentSync({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.media.icon').id
      }, 0);
      console.log('getMediaContentSync_test_0600 1' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaContentBase64Sync_test_0100
     * @tc.number getMediaContentBase64Sync_test_0100
     * @tc.desc   getMediaContentBase64Sync with res id density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaContentBase64Sync_test_0100', Level.LEVEL2, () => {
      let value: string = res.getMediaContentBase64Sync($r('app.media.icon').id, 0);
      console.log('getMediaContentBase64Sync_test_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaContentBase64Sync_test_0200
     * @tc.number getMediaContentBase64Sync_test_0200
     * @tc.desc   getMediaContentBase64Sync with resource object density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   getMediaContentBase64Sync_test_0300
     * @tc.number getMediaContentBase64Sync_test_0300
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64Sync_test_0400
     * @tc.number getMediaContentBase64Sync_test_0400
     * @tc.desc   error code 9001001 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64Sync_test_0500
     * @tc.number getMediaContentBase64Sync_test_0500
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaContentBase64Sync_test_0600
     * @tc.number getMediaContentBase64Sync_test_0600
     * @tc.desc   error code 9001002 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValueSync_test_0100
     * @tc.number getPluralStringValueSync_test_0100
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValueSync_test_0200
     * @tc.number getPluralStringValueSync_test_0200
     * @tc.desc   error code 9001001 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValueSync_test_0300
     * @tc.number getPluralStringValueSync_test_0300
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValueSync_test_0400
     * @tc.number getPluralStringValueSync_test_0400
     * @tc.desc   error code 9001002 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValueSync_test_0500
     * @tc.number getPluralStringValueSync_test_0500
     * @tc.desc   error code 9001006 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringValueSync_test_0600
     * @tc.number getPluralStringValueSync_test_0600
     * @tc.desc   error code 9001006 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValueSync_test_0100
     * @tc.number getStringArrayValueSync_test_0100
     * @tc.desc   error code 9001001 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValueSync_test_0200
     * @tc.number getStringArrayValueSync_test_0200
     * @tc.desc   error code 9001001 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValueSync_test_0300
     * @tc.number getStringArrayValueSync_test_0300
     * @tc.desc   error code 9001002 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValueSync_test_0400
     * @tc.number getStringArrayValueSync_test_0400
     * @tc.desc   error code 9001002 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValueSync_test_0500
     * @tc.number getStringArrayValueSync_test_0500
     * @tc.desc   error code 9001006 with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayValueSync_test_0600
     * @tc.number getStringArrayValueSync_test_0600
     * @tc.desc   error code 9001006 with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringByNameSync_test_0100
     * @tc.number getPluralStringByNameSync_test_0100
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getPluralStringByNameSync_test_0200
     * @tc.number getPluralStringByNameSync_test_0200
     * @tc.desc   error code 9001006 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaByNameSync_test_0100
     * @tc.number getMediaByNameSync_test_0100
     * @tc.desc   with density by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaByNameSync_test_0100', Level.LEVEL2, () => {
      let value: Uint8Array = res.getMediaByNameSync('icon', 0);
      console.log('getMediaByNameSync_test_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaByNameSync_test_0200
     * @tc.number getMediaByNameSync_test_0200
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getMediaBase64ByNameSync_test_0100
     * @tc.number getMediaBase64ByNameSync_test_0100
     * @tc.desc   with density by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getMediaBase64ByNameSync_test_0100', Level.LEVEL2, () => {
      let value: string = res.getMediaBase64ByNameSync('icon', 0);
      console.log('getMediaBase64ByNameSync_test_0100:' + value);
      expect(value !== null).assertTrue();
    })

    /**
     * @tc.name   getMediaBase64ByNameSync_test_0200
     * @tc.number getMediaBase64ByNameSync_test_0200
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayByNameSync_test_0100
     * @tc.number getStringArrayByNameSync_test_0100
     * @tc.desc   error code 9001003 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   getStringArrayByNameSync_test_0200
     * @tc.number getStringArrayByNameSync_test_0200
     * @tc.desc   error code 9001006 by name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   SUB_GLOBAL_GetLocales_0020
     * @tc.number SUB_GLOBAL_GetLocales_0020
     * @tc.desc   getLocales
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_GetLocales_0020', Level.LEVEL2, () => {
      let value: string = res.getLocales(false).toString();
      console.log('SUB_GLOBAL_GetLocales_0020:' + value);
      expect(value == 'en-US,zh-CN').assertTrue();
    })

    /**
     * @tc.name   getStringSync_test_1400
     * @tc.number getStringSync_test_1400
     * @tc.desc   errcode 9001007 with array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   isRawDir_test_0100
     * @tc.number isRawDir_test_0100
     * @tc.desc   errcode 9001005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('isRawDir_test_0100', Level.LEVEL3, () => {
      try {
        res.isRawDir('invalidPath');
      } catch (err) {
        console.log('isRawDir_test_0100 error code:' + err.code);
        expect(err.code).assertEqual('9001005');
      }
    })

    /**
     * @tc.name   SUB_GLOBAL_GetLocales_0030
     * @tc.number SUB_GLOBAL_GetLocales_0030
     * @tc.desc   getLocales
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_GetLocales_0030', Level.LEVEL2, async (done: Function) => {
      application.createModuleContext(resContext, "library").then((data: Context) => {
        console.log('SUB_GLOBAL_GetLocales_0030' + data.resourceManager.getLocales());
        expect(data.resourceManager.getLocales().length).assertEqual(0);
        done();
      }).catch((e: Error) => {
        console.log('SUB_GLOBAL_GetLocales_0030' + e.message);
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   isRawDir_test_0200
     * @tc.number isRawDir_test_0200
     * @tc.desc   isRawDir return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('isRawDir_test_0200', Level.LEVEL3, () => {
      let result = res.isRawDir('A');
      expect(result).assertTrue();
    })

    /**
     * @tc.name   SUB_GLOBAL_GETBOOLEAN_STAGE_0200
     * @tc.number SUB_GLOBAL_GETBOOLEAN_STAGE_0200
     * @tc.desc   getBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_GETBOOLEAN_STAGE_0200', Level.LEVEL2, async (done: Function) => {
      let value: boolean = res.getBoolean({
        bundleName: "ohos.acts.globalstage",
        moduleName: "entry_test",
        id: $r('app.boolean.boolean_2').id
      });
      console.log('SUB_GLOBAL_GETBOOLEAN_STAGE_0200 ' + value);
      expect(value).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_GETBOOLEAN_STAGE_0300
     * @tc.number SUB_GLOBAL_GETBOOLEAN_STAGE_0300
     * @tc.desc   getBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_GETBOOLEAN_STAGE_0300', Level.LEVEL2, async (done: Function) => {
      let value: boolean = res.getBoolean($r('app.boolean.boolean_2').id);
      console.log('SUB_GLOBAL_GETBOOLEAN_STAGE_0300 ' + value);
      expect(value).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_GLOBAL_GETBOOLEAN_STAGE_0400
     * @tc.number SUB_GLOBAL_GETBOOLEAN_STAGE_0400
     * @tc.desc   getBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_GLOBAL_GETBOOLEAN_STAGE_0400', Level.LEVEL2, async (done: Function) => {
      let value: boolean = res.getBooleanByName('boolean_2');
      console.log('SUB_GLOBAL_GETBOOLEAN_STAGE_0400 ' + value);
      expect(value).assertFalse();
      done();
    })

    console.log('*************end globalStageTest*************');
  })
}