import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, } from '../common';
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';

const TAG = "PhotoGetRecentPhotoInfo";


    export default function PhotoAccessHelperGetRecentPhotoInfo() {
      describe('PhotoAccessHelperGetRecentPhotoInfo', () => {

        beforeAll(async () => {
          console.info(TAG, 'beforeAll case');
          AppStorage
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
         * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_001
         * @tc.desc   saveCameraPhoto(imageFileType: ImageFileType): void
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_001', Level.LEVEL0, async (done: Function) => {
          const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_001';
          let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
          let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

          try {
            const recentPhotoInfo = await phAccessHelper.getRecentPhotoInfo(null);
            console.info('getRecentPhotoInfo success, recentPhotoInfo is ' + JSON.stringify(recentPhotoInfo));
            console.info(TAG,testName,'done begin call');
            done();
          }catch (error){
            console.info(TAG, testName,'failed; error: ', error);
            expect(error.code).assertEqual(401);
            console.info(TAG,testName,'done begin call');
            done();
          }
        }
        )

        /**
         * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_002
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_002
         * @tc.desc   getRecentPhotoInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_002', Level.LEVEL0, async (done: Function) => {
          const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_002';
          let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
          let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

          try {
            const recentPhotoInfo = await phAccessHelper.getRecentPhotoInfo(undefined);
            console.info('getRecentPhotoInfo success, recentPhotoInfo is ' + JSON.stringify(recentPhotoInfo));
            console.info(TAG,testName,'done begin call');
            done();
          }catch (error){
            console.info(TAG, testName,'failed; error: ', error);
            expect(error.code).assertEqual(401);
            console.info(TAG,testName,'done begin call');
            done();
          }
        }
        )
        /**
         * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_003
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_003
         * @tc.desc   saveCameraPhoto(imageFileType: ImageFileType): void
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_003', Level.LEVEL0, async (done: Function) => {
          const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_RECENT_PHOTO_INFO_003';
          let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
          let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
          let newPhotoRecentInfo:String ="";

          try {
            const recentPhotoInfo = await phAccessHelper.getRecentPhotoInfo(newPhotoRecentInfo as ESObject);
            console.info('getRecentPhotoInfo success, recentPhotoInfo is ' + JSON.stringify(recentPhotoInfo));
            console.info(TAG,testName,'done begin call');
            done();
          }catch (error){
            console.info(TAG, testName,'failed; error: ', error);
            expect(error.code).assertEqual(401);
            console.info(TAG,testName,'done begin call');
            done();
          }
        }
        )
      })

    }