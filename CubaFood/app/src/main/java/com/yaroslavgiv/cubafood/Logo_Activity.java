package com.yaroslavgiv.cubafood;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class Logo_Activity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.logo_activity);
    }

    public void onClickStart(View view) {

        Intent i = new Intent(Logo_Activity.this,MainActivity.class);
        startActivity(i);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        finish();
    }
}
