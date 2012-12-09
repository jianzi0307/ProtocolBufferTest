package app.gameconf.protocol.GetUserInfo {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FrdSmpInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("GetUserInfo.FrdSmpInfo.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var uid:String;

		/**
		 *  @private
		 */
		public static const THUMB:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("GetUserInfo.FrdSmpInfo.thumb", "thumb", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var thumb:String;

		/**
		 *  @private
		 */
		public static const LV:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("GetUserInfo.FrdSmpInfo.lv", "lv", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var lv:int;

		/**
		 *  @private
		 */
		public static const ISVIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("GetUserInfo.FrdSmpInfo.isvip", "isvip", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var isvip:Boolean;

		/**
		 *  @private
		 */
		public static const VIPLV:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("GetUserInfo.FrdSmpInfo.viplv", "viplv", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var viplv:int;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.uid);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.thumb);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.lv);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.isvip);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.viplv);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var uid$count:uint = 0;
			var thumb$count:uint = 0;
			var lv$count:uint = 0;
			var isvip$count:uint = 0;
			var viplv$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrdSmpInfo.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (thumb$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrdSmpInfo.thumb cannot be set twice.');
					}
					++thumb$count;
					this.thumb = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (lv$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrdSmpInfo.lv cannot be set twice.');
					}
					++lv$count;
					this.lv = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (isvip$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrdSmpInfo.isvip cannot be set twice.');
					}
					++isvip$count;
					this.isvip = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (viplv$count != 0) {
						throw new flash.errors.IOError('Bad data format: FrdSmpInfo.viplv cannot be set twice.');
					}
					++viplv$count;
					this.viplv = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
