import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr } from '../common';

const TAG = "PhotoAccessHelperSubPhotoAlbumChange";


export default function PhotoAccessHelperPhotoAlbumChange() {
  describe('PhotoAccessHelperPhotoAlbumChange', () => {

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
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_001
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_001
     * @tc.desc   TEST ON
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        await phAccessHelper.on('photoAlbumChange', undefined as ESObject);
        console.info(TAG, testName, 'success to on photoAlbumChange');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testName,'err:' ,JSON.stringify(error))
        expect(error.code).assertEqual('401');
        done();
      }
    }
    )

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_002
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_002
     * @tc.desc   TEST ON
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_002';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        phAccessHelper.on('photoAlbumChange', null as ESObject);
        console.info(TAG, testName, 'success to on photoAlbumChange');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testName,'err:' ,JSON.stringify(error))
        expect(error.code).assertEqual('401');
        done();
      }
    }
    )

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_PHOTO_ALBUM_CHANGE_003
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_PHOTO_ALBUM_CHANGE_003
     * @tc.desc   TEST ON
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ALBUM_CHANGE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ALBUM_CHANGE_003';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        phAccessHelper.on('photoAlbumChange', null as ESObject);
        console.info(TAG, testName, 'success to on photoAlbumChange');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testName,'err:' ,JSON.stringify(error))
        expect(error.code).assertEqual('401');
        done();
      }
    }
    )
    /**
     * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_001
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_001
     * @tc.desc   TEST OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_VIDEO_SESSION_OFF_AUTO_DEVICE_SWITCH_STATUS_CHANGE_003';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        phAccessHelper.off('photoAlbumChange', null as ESObject);
        console.info(TAG, testName, 'success to on photoAlbumChange');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testName,'err:' ,JSON.stringify(error))
        expect(error.code).assertEqual('401');
        done();
      }
    }
    )

    /**
     * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_002
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_002
     * @tc.desc   TEST OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_002';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        phAccessHelper.off('photoAlbumChange', undefined as ESObject);
        console.info(TAG, testName, 'success to on photoAlbumChange');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testName,'err:' ,JSON.stringify(error))
        expect(error.code).assertEqual('401');
        done();
      }
    }
    )

    /**
     * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_003
     * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_003
     * @tc.desc   TEST OFF
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_VIDEO_SESSION_OFF_PHOTO_ALBUM_CHANGE_003';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        phAccessHelper.off('photoAlbumChange', "" as ESObject);
        console.info(TAG, testName, 'success to on photoAlbumChange');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testName,'err:' ,JSON.stringify(error))
        expect(error.code).assertEqual('401');
        done();
      }
    }
    )

  })

}