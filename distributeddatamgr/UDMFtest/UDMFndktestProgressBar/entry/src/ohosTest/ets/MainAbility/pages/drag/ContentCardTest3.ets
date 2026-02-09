import { ContentFormCard, FormType, uniformDataStruct } from '@kit.ArkData'
import { common } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import { CommonView } from '../../componet/CommonView';

@Entry
@Component
struct ContentCardTest3 {
  @State contentForm: uniformDataStruct.ContentForm = {
    uniformDataType: 'general.content-form',
    title: ''
  };
  @State startToShow: boolean = false;

  aboutToAppear(): void {
    // 2. 初始化数据
    this.initData();
  }

  async initData() {
    let context = getContext(this) as common.UIAbilityContext;
    try {
      let appIcon = await context.resourceManager.getMediaContent($r('app.media.startIcon').id);
      let thumbImage = await context.resourceManager.getMediaContent($r('app.media.foreground').id);
      this.contentForm = {
        uniformDataType: 'general.content-form',
        title: 'Content form title',
        thumbData: appIcon,
        description: 'Content form description',
        appIcon: thumbImage,
        appName: 'com.test.demo'
      }; 
    } catch (err) {
      console.info('Init data error');
    }
  }

  build() {
    Column() {
      Button('card')
        .onClick(() => {
          // 3. 点击后startToShow变为true，页面重新渲染
          this.startToShow = true;
        })
        .id('card')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      if (this.startToShow) {
        // 4. 使用内容卡片，传入对应的参数
        ContentFormCard({
          contentFormData: this.contentForm,
          formType: FormType.TYPE_BIG,
          formWidth: 110,
          formHeight: 50,
          handleOnClick: () => {
            console.info('Clicked card');
          }
        }).id('bigCard')
      }
    }
  }
}