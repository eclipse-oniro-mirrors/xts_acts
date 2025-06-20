import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import uiExtension from '@ohos.arkui.uiExtension';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Extension {
  @State message: string = 'EmbeddedUIExtensionAbility Index';
  private session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session');
  private extensionWindow: uiExtension.WindowProxy | undefined = this.session?.getUIExtensionWindowProxy();
  private subWindow: window.Window | undefined = undefined;

  aboutToAppear(): void {
    this.extensionWindow?.on('windowSizeChange', (size: window.Size) => {
      console.info(`size = ${JSON.stringify(size)}`);
    });
    this.extensionWindow?.on('avoidAreaChange', (info: uiExtension.AvoidAreaInfo) => {
      console.info(`type = ${JSON.stringify(info.type)}, area = ${JSON.stringify(info.area)}`);
    });
  }

  aboutToDisappear(): void {
    this.extensionWindow?.off('windowSizeChange');
    this.extensionWindow?.off('avoidAreaChange');
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Button("获取系统规避区信息").width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
        let avoidArea: window.AvoidArea | undefined = this.extensionWindow?.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        console.info(`系统规避区: ${JSON.stringify(avoidArea)}`);
      })
      Button("创建子窗口").width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
        let subWindowOpts: window.SubWindowOptions = {
          'title': 'This is a subwindow',
          decorEnabled: true
        };
        this.extensionWindow?.createSubWindowWithOptions('subWindowForHost', subWindowOpts)
          .then((subWindow: window.Window) => {
            this.subWindow = subWindow;
            this.subWindow.loadContent('pages/Index', storage, (err, data) =>{
              if (err && err.code != 0) {
                return;
              }
              this.subWindow?.resize(300, 300, (err, data)=>{
                if (err && err.code != 0) {
                  return;
                }
                this.subWindow?.moveWindowTo(100, 100, (err, data)=>{
                  if (err && err.code != 0) {
                    return;
                  }
                  this.subWindow?.showWindow((err, data) => {
                    if (err && err.code == 0) {
                      console.info(`The subwindow has been shown!`);
                    } else {
                      console.error(`Failed to show the subwindow!`);
                    }
                  });
                });
              });
            });
          }).catch((error: BusinessError) => {
          console.error(`Create subwindow failed: ${JSON.stringify(error)}`);
        })
      })
    }.width('100%').height('100%')
  }
}