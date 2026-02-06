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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, afterAll } from '@ohos/hypium'
import { common } from '@kit.AbilityKit'
import { driveFn, photoKeys, sleep, getPermission, fetchAllOption, } from '../common'
import { JSON } from '@kit.ArkTS'

let TAG = 'xts.PhotoAssetSuppTest'

export default function CommitModifySuppTest() {
  describe('CommitModifySuppTest', () => {
    let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      AppStorage.setOrCreate('testString', 'abc');
      AppStorage.setOrCreate('testNumber', -1);
    });

    afterAll(async () => {
      AppStorage.delete('testString');
      AppStorage.delete('testNumber');
    })

    let commitModifyTest =
      async (done: Function, testName: string, member: string, values: string,
        callback: (res: number) => void) => {
        try {
          const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await helper.getAssets(fetchOps);
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(member);
          console.info(TAG, testName, 'photoAsset get photoAssetTitle = ', photoAssetTitle);
          photoAsset.set(photoKeys.TITLE, values);
          await photoAsset.commitModify();
          console.error(TAG, testName, ' success')
          expect().assertFail();
          done();
        } catch (err) {
          console.error(TAG, testName, JSON.stringify(err), err.code);
          callback(err.code);
          done();
        }
      }

    let commitModifyPromiseTest =
      async (done: Function, testName: string, member: string, values: string,
        callback: (res: number) => void) => {
        try {
          const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await helper.getAssets(fetchOps);
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(member);
          console.info(TAG, testName, 'photoAsset get photoAssetTitle = ', photoAssetTitle);
          photoAsset.set(photoKeys.TITLE, values);
          photoAsset.commitModify((err) => {
            if (err === undefined) {
              let newPhotoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(member);
              console.info(TAG, testName, 'photoAsset get newPhotoAssetTitle = ', newPhotoAssetTitle);
              expect().assertFail();
              done();
            } else {
              console.error(TAG, testName, `commitModify failed, error: `, JSON.stringify(err), err.code);
              callback(err.code);
              done();
            }
          });
        } catch (err) {
          console.error(testName, JSON.stringify(err), err.code);
          expect().assertFail();
          done();
        }
      };

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0100';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.png',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0200';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.jpg',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0300';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.mp4',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0400';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.mov',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0500';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.gif',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0600';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.bmp',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0700';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.ico',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0800';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.dng',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_0900';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.webp',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1000';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.svg',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1100';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.jpeg',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1200';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.123',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1300';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.abc',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1400';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, '.newTitle2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1500';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, ':newTitle2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1600';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new\\Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1700';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new/Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1800';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new*Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_1900';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new?Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2000';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new"Title2.png',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2100';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new`Title2.png',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2200';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, "new'Title2",
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2300';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new<Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2400';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new>Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2500';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new|Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2600';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new{Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2700';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new}Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2800';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new[Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_2900';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, 'new]Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3000';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, "",
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3100';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, "a".repeat(252),
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_3200';
      await commitModifyTest(done, testName, photoKeys.DISPLAY_NAME, "a/b/c/" + "x".repeat(250),
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0100';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.png',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0200';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.jpg',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0300';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.mp4',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0400';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.mov',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0500';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.gif',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0600';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.bmp',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0700';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.ico',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0800';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.dng',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_0900';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.webp',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1000';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.svg',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1100';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.jpeg',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1200';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.123',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1300';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'newTitle2.abc',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1400';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, '.newTitle2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1500';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, ':newTitle2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1600';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new\\Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1700';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new/Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1800';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new*Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_1900';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new?Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2000';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new"Title2.png',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2100';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new`Title2.png',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2200';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, "new'Title2",
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2300';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new<Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2400';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new>Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2500';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new|Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2600';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new{Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2700';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new}Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2800';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new[Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_2900';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, 'new]Title2',
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3000';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, "",
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3100';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, "a".repeat(252),
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_3200';
      await commitModifyPromiseTest(done, testName, photoKeys.DISPLAY_NAME, "a/b/c/" + "x".repeat(250),
        (errCode: number) => {
          expect(errCode).assertEqual('14000001')
        });
    });
  })
}
