import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
// /data/app/el2/100/base/com.example.cloneAppNoSys/cache
import { BusinessError } from '@kit.BasicServicesKit';
import bundleManager from '@ohos.bundle.bundleManager';
import { fileIo as fs, Filter, ListFileOptions} from '@kit.CoreFileKit';
const CACHE_PATH = '/data/storage/el2/base/cache';

let domain = 0;
let tag: string = 'testTag';
let listFileOption: ListFileOptions = {
  recursion: false,
  listNum: 0,
  filter: {
    suffix: [".png", ".jpg", ".jpeg"],
    displayName: ["*abc", "efg*"],
    fileSizeOver: 1024
  }
};

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.name   Test_cleanBundleCacheFilesForSelf_001
     * @tc.number Test_cleanBundleCacheFilesForSelf_001
     * @tc.desc   test cleanBundleCacheFilesForSelf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_cleanBundleCacheFilesForSelf_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(domain, tag, '%{public}s', 'it begin');
      try{
        let isExist:boolean = fs.accessSync(CACHE_PATH);
        hilog.info(domain, tag, `path is ${JSON.stringify(CACHE_PATH)}`);
        if (isExist) {
          hilog.info(domain, tag, 'Dir Exists Crate File begin');
          const filePath = `/data/storage/el2/base/cache/example.txt`;
          const file = await fs.open(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const text = 'HelloWorld';
          await fs.write(file.fd, text);
          await fs.close(file.fd);
          hilog.info(domain, tag, `Txt File Save  Success Path is ${JSON.stringify(filePath)}`);
          try {
            await bundleManager.cleanBundleCacheFilesForSelf().then(() => {
              hilog.info(domain, tag, `cleanBundleCacheFilesForSelf successfully.`);
              let filenames = fs.listFileSync(CACHE_PATH, listFileOption);
              hilog.info(domain, tag, `filenames.length is ${JSON.stringify(filenames.length)}`);
              (filenames.length == 0) ? expect(true).assertTrue() : expect(false).assertTrue();
              done()
            }).catch((error: Error) => {
              hilog.info(domain, tag, `cleanBundleCacheFilesForSelf failed. Cause: ${JSON.stringify(error.message)}`);
              expect(false).assertTrue();
              done();
            });
          } catch (error) {
            let message = (error as BusinessError).message;
            hilog.info(domain, tag, `cleanBundleCacheFilesForSelf failed. Cause: ${JSON.stringify(message)}`);
            expect(false).assertTrue();
            done();
          }
        } else {
          console.info("file not exists");
          hilog.info(domain, tag, 'Dir Not Exist !');
          expect(false).assertTrue();
          done();
        }
      }catch(error){
        let err: BusinessError = error as BusinessError;
        hilog.info(domain, tag, `accessSync failed with error message: ${JSON.stringify(err.message)}, error code:  ${JSON.stringify( err.code)}`);
        done();
      }
    })
  })
}