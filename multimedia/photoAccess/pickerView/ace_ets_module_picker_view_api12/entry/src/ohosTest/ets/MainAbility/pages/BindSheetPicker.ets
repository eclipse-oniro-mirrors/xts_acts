import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { EventType } from '../common/Common';

const topMargin: number = 20;

@Entry
@Component
struct BindSheetPicker {
  private photoSelectOptions: photoAccessHelper.PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
  private eventId: number = EventType.PHOTO_PICKER_INFO;

  sendEvent(message: Object, eventId: number) {
    let eventData: events_emitter.EventData = {
      data: {
        'msg': message,
      }
    }
    let event: events_emitter.InnerEvent = {
      eventId: eventId,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.emit(event, eventData)
  }

  aboutToAppear() {
    this.photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
    this.photoSelectOptions.maxSelectNumber = 3;
    let parameter: object = router.getParams();
    if (parameter && parameter['eventId'] != undefined) {
      this.eventId = Number(parameter['eventId']);
    }
    if (parameter && parameter['pickerOptions'] != undefined) {
      this.photoSelectOptions = parameter['pickerOptions'];
    }
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
        .id('btnSelectPhoto')
        .width(150)
        .margin({ top: topMargin })
        .onClick(() => {
          let photoPicker = new photoAccessHelper.PhotoViewPicker();
          console.log('btnSelectPhoto onclick')
          photoPicker.select(this.photoSelectOptions)
            .then((photoSelectResult: photoAccessHelper.PhotoSelectResult) => {
              console.info('PhotoViewPicker.select success, PhotoPickerResult uri: ' +
                JSON.stringify(photoSelectResult));
              this.sendEvent(photoSelectResult, this.eventId);
            }).catch((err: BusinessError) => {
              console.error('PhotoViewPicker.select failed with err: ' + JSON.stringify(err));
            });
        })
      }.padding(20)
  }
}
