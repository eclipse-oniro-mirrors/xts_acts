import {
  PhotoPickerComponent,
  PickerController,
  PickerOptions,
  DataType,
  ItemInfo,
  ItemType,
  PhotoBrowserInfo,
  ClickType,
  PickerColorMode,
  MaxSelected,
  MaxCountType
} from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerComponent, AlbumPickerOptions, AlbumInfo } from '@ohos.file.AlbumPickerComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { EventType } from '../common/Common';
import { PhotoPickerResult } from '../common/PhotoPickerResult';

@Entry
@Component
struct PickerComponent {
  @State pickerController: PickerController = new PickerController();
  @State pickerOptions: PickerOptions = new PickerOptions();
  albumOptions: AlbumPickerOptions = new AlbumPickerOptions();
  @State selectedUris: string[] = [];
  @State allBackGroundColor: number = 0xf1f3f5;
  @State videoBackGroundColor: number = 0xffffff;
  @State photoBackGroundColor: number = 0xffffff;
  @State isShowAll: boolean = true;
  @State isShowVideo: boolean = false;
  @State isShowPhoto: boolean = false;
  @State isShowAlbum: boolean = false;
  private isBlock: boolean = false;
  @State isPhotoPickerShow: boolean = true;
  @State fontColor: string = '#182431222';
  @State selectedFontColor: string = '#007DFF';
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();
  eventId: number = 0;

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

  getPhotoPickerResult(): PhotoPickerResult {
    let result: PhotoPickerResult = new PhotoPickerResult();
    result.checkBoxColor = this.pickerOptions.checkBoxColor ?? '';
    result.backgroundColor = this.pickerOptions.backgroundColor ?? '';
    result.isRepeatSelectSupported = this.pickerOptions.isRepeatSelectSupported ?? false;
    result.photoBrowserBackgroundColorMode = this.pickerOptions.photoBrowserBackgroundColorMode ?? 0;
    result.maxSelectedReminderMode = this.pickerOptions.maxSelectedReminderMode ?? 0;
    result.checkboxTextColor = this.pickerOptions.checkboxTextColor ?? '';
    result.selectMode = this.pickerOptions.selectMode ?? 0;
    result.maxSelectCount = this.pickerOptions.maxSelectNumber ?? 500;
    result.maxPhotoSelectNumber = this.pickerOptions.maxPhotoSelectNumber ?? 500;
    result.maxVideoSelectNumber = this.pickerOptions.maxVideoSelectNumber ?? 500;
    return result;
  }

  private onEnterPhotoBrowser(photoBrowserInfo: PhotoBrowserInfo): boolean {
    this.sendEvent(photoBrowserInfo, this.eventId);
    console.info('onEnterPhotoBrowser' + JSON.stringify(photoBrowserInfo));
    return false;
  }

  private onExitPhotoBrowser(photoBrowserInfo: PhotoBrowserInfo): boolean {
    console.info('onExitPhotoBrowser' + JSON.stringify(photoBrowserInfo));
    return false;
  }

  private onPickerControllerReady(): void {
    console.info('onPickerControllerReady');
  }

  private onAlbumClick(albumInfo: AlbumInfo): boolean {
    this.isShowAlbum = false;
    console.info('onAlbumClick' + JSON.stringify(albumInfo?.uri));
    this.sendEvent(albumInfo, EventType.ALBUM_INFO);
    if (albumInfo?.uri) {
      this.pickerController.setData(DataType.SET_ALBUM_URI, albumInfo.uri);
      console.info('onALbumClick' + JSON.stringify(albumInfo.uri));
    }
    return true;
  }

  private onSelect(uri: string): void {
    if (uri) {
      this.selectedUris.push(uri);
    }
    this.pickerOptions.preselectedUris = [...this.selectedUris];
    console.info('onSelect' + JSON.stringify(this.selectedUris));
  }

  private onDeselect(uri: string): void {
    if (uri) {
      this.selectedUris = this.selectedUris.filter((item: string) => {
        return item !== uri;
      })
    }
    this.pickerOptions.preselectedUris = [...this.selectedUris];
    console.info('onDeselect' + JSON.stringify(this.selectedUris));
  }

  private onItemClicked(itemInfo: ItemInfo, clickType: ClickType): boolean {
    if (!itemInfo) {
      return false;
    }

    this.sendEvent(itemInfo, EventType.SELECT_ITEM_INFO);
    this.sendEvent(clickType, EventType.SELECT_CLICKTYPE);
    let type: ItemType | undefined = itemInfo.itemType;
    let uri: string | undefined = itemInfo.uri;
    if (type === ItemType.CAMERA) {
      console.info('onCameraClick');
      if (this.isBlock) {
        return false;
      }
    } else if (type === ItemType.THUMBNAIL) {
      if (clickType === ClickType.SELECTED) {
        if (this.isBlock) {
          return false;
        }
        if (uri) {
          this.selectedUris.push(uri);
          this.pickerOptions.preselectedUris = [...this.selectedUris];
        }
      }
    } else {
      if (uri) {
        this.selectedUris = this.selectedUris.filter((item: String) => {
          return item !== uri;
        })
        this.pickerOptions.preselectedUris = [...this.selectedUris];
      }
    }
    console.info('onItemClicked' + JSON.stringify(itemInfo));
    return true;
  }

  aboutToDisappear(): void {
    console.info('testPicker disappear');
  }

  aboutToAppear() {
    let parameter: object = router.getParams();
    if (parameter['eventId'] != undefined) {
      this.eventId = parameter['eventId'];
    }
    if (parameter['pickerOptions'] != undefined) {
      this.pickerOptions = parameter['pickerOptions'];
    }
    if (parameter['albumOptions'] != undefined) {
      this.albumOptions = parameter['albumOptions'];
    }
    console.info('eventId=' + this.eventId);
  }

  @Builder
  tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }

  @Builder
  ButtonBar() {
    Row() {
      Button('视频和图片').width('50%').height('10%')
        .onClick(() => {
          this.isShowAll = true;
          this.isShowVideo = false;
          this.isShowPhoto = false;
          this.pickerController.setData(DataType.SET_SELECTED_URIS, this.selectedUris);
        })
      Button('全部相册').width('50%').height('10%')
        .onClick(() => {
          this.isShowAlbum = true;
        }).id('albumButton')
    }

    Row() {
      Button('返回测试结果').width('50%').height('8%').onClick(() => {
        console.info('testPicker setData');
        let result: PhotoPickerResult = this.getPhotoPickerResult();
        this.sendEvent(result, EventType.PHOTO_PICKER_INFO);
      }).id('resultButton')
      Button('选择修改数量').width('50%').height('8%').onClick(() => {
        let maxSelect: MaxSelected = new MaxSelected();
        maxSelect.data = new Map<MaxCountType, number>([[MaxCountType.TOTAL_MAX_COUNT, 1],
          [MaxCountType.PHOTO_MAX_COUNT, 1], [MaxCountType.VIDEO_MAX_COUNT, 1]]);
        this.pickerController.setMaxSelected(maxSelect);
      }).id('changeNumButton')
    }
  }

  @Builder
  buildPhotoPickerComponent() {
    Stack() {
      PhotoPickerComponent({
        pickerOptions: this.pickerOptions,
        onSelect: (uri: string): void => this.onSelect(uri),
        onDeselect: (uri: string): void => this.onDeselect(uri),
        onItemClicked: (itemInfo: ItemInfo, clickType: ClickType): boolean =>
        this.onItemClicked(itemInfo, clickType),
        onEnterPhotoBrowser: (photoBrowserInfo: PhotoBrowserInfo): boolean =>
        this.onEnterPhotoBrowser(photoBrowserInfo),
        onExitPhotoBrowser: (photoBrowserInfo: PhotoBrowserInfo): boolean =>
        this.onExitPhotoBrowser(photoBrowserInfo),
        onPickerControllerReady: (): void => this.onPickerControllerReady(),
        pickerController: this.pickerController,
      })
        .height('82%')
        .width('100%')
        .visibility(this.isShowAll ? Visibility.Visible : Visibility.Hidden)
        .id('PhotoPickerComponent')
    }
  }

  @Builder
  buildImage(){
    ForEach(this.selectedUris, (uri: string) => {
      Image(uri).height('10%').width('20%').onClick(() => {
        this.selectedUris = this.selectedUris.filter((item: string) => {
          return uri != item;
        })
        this.pickerController.setData(DataType.SET_SELECTED_URIS, this.selectedUris);
      })
    }, (uri: string) => JSON.stringify(uri))
  }

  @Builder
  buildAlbumPickerComponent() {
    Row() {
      this.buildImage();
    }

    if (this.isShowAlbum) {
      AlbumPickerComponent({
        albumPickerOptions: this.albumOptions,
        onAlbumClick: (albumInfo: AlbumInfo): boolean => this.onAlbumClick(albumInfo),
      }).height('100%').width('100%').id('AlbumPickerComponent')
    }
  }

  build() {
    Stack() {
      Column() {
        this.ButtonBar();
        this.buildPhotoPickerComponent();
      }

      this.buildAlbumPickerComponent();
    }
  }
}