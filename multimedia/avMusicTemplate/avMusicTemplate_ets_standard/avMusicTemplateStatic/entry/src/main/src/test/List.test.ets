import avMusicTemplateManagerTest from './case/AVMusicTemplateManager.test';
import avMusicTemplateTest from './case/AVMusicTemplate.test';
import avMusicTemplateControllerTest from './case/AVMusicTemplateController.test';
import avMusicTemplateEnumTest from './case/AVMusicTemplateEnum.test';
import avMusicTemplateEntityTest from './case/AVMusicTemplateEntity.test';
import avMusicTemplateControllerThrowsErrorTest from './case/AVMusicTemplateControllerThrowsError.test';
import avMusicTemplateThrowsErrorTest from './case/AVMusicTemplateThrowsError.test';
import avMusicTemplateManagerThrowsErrorTest from './case/AVMusicTemplateManagerThrowsError.test';

export default function testsuite() {
  avMusicTemplateManagerTest();
  avMusicTemplateTest();
  avMusicTemplateControllerTest();
  avMusicTemplateEnumTest();
  avMusicTemplateEntityTest();
  avMusicTemplateControllerThrowsErrorTest();
  avMusicTemplateThrowsErrorTest();
  avMusicTemplateManagerThrowsErrorTest();
}