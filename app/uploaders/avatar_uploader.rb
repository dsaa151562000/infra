# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

   case Rails.env
   when 'production'
      storage :fog
   when 'development'
      storage :fog
   when 'staging'
      storage :fog
  end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

 # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

 # 画像の上限を700pxにする
#process :resize_to_limit => [1300, 750]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定(1280*720)
  version :thumb_1280 do
    process :resize_to_fill => [1280, 720]
  end

  # サムネイルを生成する設定(760*428)
  version :thumb_760 do
    process :resize_to_fill => [760, 428]
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

 # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

end
