class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :summary,
              :temperature,
              :apparent_temperature,
              :humidity,
              :visibility,
              :uv_index
end
