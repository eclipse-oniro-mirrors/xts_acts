import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base';

const topMargin: number = 20;

@Entry
@Component
struct BindSheetPicker {
  private photoSelectOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();

  aboutToAppear() {
    this.photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
    this.photoSelectOptions.maxSelectNumber = 3;
  }

  build() {
    Column() {
      Button('TEXT_DONE')
        .margin({ top: topMargin })
        .onClick(() => {
          this.photoSelectOptions.completeButtonText = photoAccessHelper.CompleteButtonText.TEXT_DONE;
        })
      Button('TEXT_SEND')
        .margin({ top: topMargin })
        .onClick(() => {
          this.photoSelectOptions.completeButtonText = photoAccessHelper.CompleteButtonText.TEXT_SEND;
        })
      Button('TEXT_ADD')
        .margin({ top: topMargin })
        .onClick(() => {
          this.photoSelectOptions.completeButtonText = photoAccessHelper.CompleteButtonText.TEXT_ADD;
        })
      
      Button('select photo')
        .width(150)
        .margin({ top: topMargin })
        .onClick(() => {
          let photoPicker = new photoAccessHelper.PhotoViewPicker();
          photoPicker.select(this.photoSelectOptions)
            .then((photoSelectResult: photoAccessHelper.PhotoSelectResult) => {
              console.info('PhotoViewPicker.select success, PhotoPickerResult uri: ' +
                JSON.stringify(photoSelectResult));
            }).catch((err: BusinessError) => {
              console.error('PhotoViewPicker.select failed with err: ' + JSON.stringify(err));
            });
        })
      }.padding(20)
  }
}
