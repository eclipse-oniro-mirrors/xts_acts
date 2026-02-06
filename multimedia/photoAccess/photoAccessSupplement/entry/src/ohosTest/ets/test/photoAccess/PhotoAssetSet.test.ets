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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr, fetchOption } from '../common';
import common from '@ohos.app.ability.common';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'PhotoAssetsSetSupp';


async function photoAccessHelperSetTest(done: Function, testName: string, member:string,value:string,newTitle:string|undefined|null,callback: (errCode?: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOption);
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    photoAsset.set(member, value);
    let result = photoAsset.get(member)
    console.info(TAG, testName, `photoAsset.title is: ${result},photoAsset set member and value success`);
    expect(result).assertEqual(newTitle);
  } catch (error) {
    console.error(TAG, testName, `failed; error:${error.message},${error}and:${error.code}`);
    callback(error.code);
    done();
  }
}

export default function PhotoAccessHelperSetTestSupp() {
  describe('PhotoAccessHelperSetTestSupp', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   Photo_Assets_Set_001
     * @tc.number Photo_Assets_Set_001
     * @tc.desc   Set value is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_001';
      let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
      AppStorage.setOrCreate('key', undefined);
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, undefined, errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })

    /**
     * @tc.name   Photo_Assets_Set_002
     * @tc.number Photo_Assets_Set_002
     * @tc.desc   Set value is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_002';
      let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
      AppStorage.setOrCreate('key', null);
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value,null,  errCode => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_003
     * @tc.number Photo_Assets_Set_003
     * @tc.desc   Set value is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_003';
      let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertFalse();
      })
      done();
    })

    /**
     * @tc.name   Photo_Assets_Set_004
     * @tc.number Photo_Assets_Set_004
     * @tc.desc   Set title length is 1,value is" "
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_004';
      let title: string = " ";
      await photoAccessHelperSetTest(done, testName, title, 'newTitle','newTitle',  errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })

    /**
     * @tc.name   Photo_Assets_Set_005
     * @tc.number Photo_Assets_Set_005
     * @tc.desc   Set title value is "#"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_005';
      let title: string = "#";
      await photoAccessHelperSetTest(done, testName, title, 'newTitle','newTitle',errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_006
     * @tc.number Photo_Assets_Set_006
     * @tc.desc   Set title value is "< >"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_006';
      let title: string = "< >";
      await photoAccessHelperSetTest(done, testName, title, 'newTitle', 'newTitle', errCode => {
        console.info(TAG, testName,`errCode number`);
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_007
     * @tc.number Photo_Assets_Set_007
     * @tc.desc   Set title value is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_007';
      let title: string = " ";
      await photoAccessHelperSetTest(done, testName, title, 'newTitle', 'newTitle', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })

    /**
     * @tc.name   Photo_Assets_Set_008
     * @tc.number Photo_Assets_Set_008
     * @tc.desc   Set title value length is 244
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_008';
      let title: string = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij";
      await photoAccessHelperSetTest(done, testName, title, 'newTitle', 'newTitle', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_009
     * @tc.number Photo_Assets_Set_009
     * @tc.desc   Set title value length is 245
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_009';
      let title: string = "0abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij";
      await photoAccessHelperSetTest(done, testName, title, 'newTitle', 'newTitle', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_010
     * @tc.number Photo_Assets_Set_010
     * @tc.desc   Set title is PhotoKeys.URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_010';
      let title: string = photoAccessHelper.PhotoKeys.URI.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_011
     * @tc.number Photo_Assets_Set_011
     * @tc.desc   Set title is PhotoKeys.PHOTO_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_011';
      let title: string = photoAccessHelper.PhotoKeys.PHOTO_TYPE.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_012
     * @tc.number Photo_Assets_Set_012
     * @tc.desc   Set title is PhotoKeys.DISPLAY_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_012';
      let title: string = photoAccessHelper.PhotoKeys.DISPLAY_NAME.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_013
     * @tc.number Photo_Assets_Set_013
     * @tc.desc   Set title is PhotoKeys.SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_013';
      let title: string = photoAccessHelper.PhotoKeys.SIZE.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_014
     * @tc.number Photo_Assets_Set_014
     * @tc.desc   Set title is PhotoKeys.DATE_ADDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_014';
      let title: string = photoAccessHelper.PhotoKeys.DATE_ADDED.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_015
     * @tc.number Photo_Assets_Set_015
     * @tc.desc   Set title is PhotoKeys.DATE_MODIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_015';
      let title: string = photoAccessHelper.PhotoKeys.DATE_MODIFIED.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_016
     * @tc.number Photo_Assets_Set_016
     * @tc.desc   Set title is PhotoKeys.DURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_016';
      let title: string = photoAccessHelper.PhotoKeys.DURATION.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_017
     * @tc.number Photo_Assets_Set_017
     * @tc.desc   Set title is PhotoKeys.WIDTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_017';
      let title: string = photoAccessHelper.PhotoKeys.WIDTH.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_018
     * @tc.number Photo_Assets_Set_018
     * @tc.desc   Set title is PhotoKeys.HEIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_018';
      let title: string = photoAccessHelper.PhotoKeys.HEIGHT.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })

    /**
     * @tc.name   Photo_Assets_Set_019
     * @tc.number Photo_Assets_Set_019
     * @tc.desc   Set title is PhotoKeys.ORIENTATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_019';
      let title: string = photoAccessHelper.PhotoKeys.ORIENTATION.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_020
     * @tc.number Photo_Assets_Set_020
     * @tc.desc   Set title is PhotoKeys.FAVORITE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_020';
      let title: string = photoAccessHelper.PhotoKeys.FAVORITE.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_021
     * @tc.number Photo_Assets_Set_021
     * @tc.desc   Set title is PhotoKeys.DATE_ADDED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_021';
      let title: string = photoAccessHelper.PhotoKeys.DATE_ADDED_MS.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_022
     * @tc.number Photo_Assets_Set_022
     * @tc.desc   Set title is PhotoKeys.DATE_MODIFIED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_022';
      let title: string = photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_023
     * @tc.number Photo_Assets_Set_023
     * @tc.desc   Set title is PhotoKeys.PHOTO_SUBTYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_023';
      let title: string = photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_024
     * @tc.number Photo_Assets_Set_024
     * @tc.desc   Set title is PhotoKeys.DYNAMIC_RANGE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_024';
      let title: string = photoAccessHelper.PhotoKeys.DYNAMIC_RANGE_TYPE.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_025
     * @tc.number Photo_Assets_Set_025
     * @tc.desc   Set title is PhotoKeys.COVER_POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_025';
      let title: string = photoAccessHelper.PhotoKeys.COVER_POSITION.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })

    /**
     * @tc.name   Photo_Assets_Set_026
     * @tc.number Photo_Assets_Set_026
     * @tc.desc   Set title is PhotoKeys.BURST_KEY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_026';
      let title: string = photoAccessHelper.PhotoKeys.BURST_KEY.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_027
     * @tc.number Photo_Assets_Set_027
     * @tc.desc   Set title is PhotoKeys.LCD_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_027';
      let title: string = photoAccessHelper.PhotoKeys.LCD_SIZE.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_028
     * @tc.number Photo_Assets_Set_028
     * @tc.desc   Set title is PhotoKeys.THM_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_028';
      let title: string = photoAccessHelper.PhotoKeys.THM_SIZE.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_029
     * @tc.number Photo_Assets_Set_029
     * @tc.desc   Set title is PhotoKeys.DETAIL_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_029';
      let title: string = photoAccessHelper.PhotoKeys.DETAIL_TIME.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_030
     * @tc.number Photo_Assets_Set_030
     * @tc.desc   Set title is PhotoKeys.DATE_TAKEN_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_030';
      let title: string = photoAccessHelper.PhotoKeys.DATE_TAKEN_MS.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_031
     * @tc.number Photo_Assets_Set_031
     * @tc.desc   Set title is PhotoKeys.POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_031';
      let title: string = photoAccessHelper.PhotoKeys.POSITION.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_032
     * @tc.number Photo_Assets_Set_032
     * @tc.desc   Set title is PhotoKeys.MEDIA_SUFFIX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_032';
      let title: string = photoAccessHelper.PhotoKeys.MEDIA_SUFFIX.toString();
      console.info(TAG,testName,'get photoAccess title',title)
      AppStorage.setOrCreate('key', '');
      let value: string = AppStorage.get('key') as ESObject;
      await photoAccessHelperSetTest(done, testName, title, value, '', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_033
     * @tc.number Photo_Assets_Set_033
     * @tc.desc   Set title value length is 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_008';
      let title: string = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstadfereuvwxyzabcdefghijdddddklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij";
      await photoAccessHelperSetTest(done, testName, title, 'newTitle', 'newTitle', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })
    /**
     * @tc.name   Photo_Assets_Set_034
     * @tc.number Photo_Assets_Set_034
     * @tc.desc   Set title value length is 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Photo_Assets_Set_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Assets_Set_009';
      let title: string = "a1bcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstadfereuvwxyzabcdefghijdddddklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij";
      await photoAccessHelperSetTest(done, testName, title, 'newTitle', 'newTitle', errCode => {
        expect(errCode).assertEqual('14000014');
      })
      done();
    })


  })
}