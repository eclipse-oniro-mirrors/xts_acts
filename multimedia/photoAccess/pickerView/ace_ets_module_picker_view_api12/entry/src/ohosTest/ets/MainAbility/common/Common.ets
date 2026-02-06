export enum EventType {
  PHOTO_PICKER_INFO = 10001,
  SELECT_ITEM_INFO,
  ALBUM_INFO,
  SELECT_CLICKTYPE,
  RECENT_PHOTO_INFO,
  VIDEO_PLAY_STATE,
}

export default class CommonFunc {
  public static sleep(time: number) {
    return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
  }
}